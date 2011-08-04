require 'pp'

class FacebookController < ApplicationController
  ensure_authenticated_to_facebook

  def canvas
    fbsession = session[:facebook_session]
    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)

    @faves = @user.beens.where(:favorite => true)
    @wants = @user.beens.where(:want => true)
    fbsession = session[:facebook_session]

    @buds_count    = 0
    @friends_count = 0

    @fbuser.friends.each do |friend|
      @friends_count += 1
      @buds_count    += 1 if User.exists?(:uid => friend.uid)
      puts "Checking ", friend.uid
    end

    @name = @user.name
    @pic  = @user.pic_square_with_logo

    @question = Question.random
    @question = nil if Answer.exists?(:question_id => @question.id, :user_id => @user.id)
    @place = Place.random
  end

  def next_question
    fbsession = session[:facebook_session]
    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)
    
    @question_id = params[:question_id]
    @answer_id   = params[:answer_id]
    @question    = Question.find(@question_id)
    @correct     = @question.answer.to_s == @answer_id
    

    @answer_element = "answer#{@answer_id}"
    
    render(:update) {|page|
      @user = User.find_or_create_by_facebook_user session[:facebook_session].user

      already_answered = Answer.exists?(:user_id => @user.id, :question_id => @question_id)
      if (!@correct)
        @user.answers << Answer.create(:question_id => @question_id, :user_id => @user.id, :correct => false) unless already_answered

        page.visual_effect :highlight, @answer_element, :startcolor => "#eceff6", :endcolor => "#ffebe8",
                                                        :restorecolor => "#eceff6"
        page.visual_effect :shake, @answer_element
      else
        unless already_answered
          @user.answers << Answer.create(:question_id => @question_id, :user_id => @user.id, :correct => true)
          answer_score = @user.answer_score
          page.replace_html 'score-answers', answer_score
          page.visual_effect :highlight, 'score-answers'
        end
        
        @question = Question.random
        @question = nil if Answer.exists?(:question_id => @question.id, :user_id => @user.id)
        @place = Place.random
        if !@question
          page.replace_html 'question', :partial => 'place'
        else
          page.replace_html 'question', :partial => 'question'
        end
      end
    }
  end

  def next_place
    fbsession = session[:facebook_session]
    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)

    @place_id  = params[:place_id]
    @been   = params[:been]

    been = Been.find_or_create_by_place_id_and_user_id(:place_id => @place_id, :user_id => @user.id)
    been.yes  = (@been == 'yes' || @been == 'favorite')
    been.no   = @been == 'no'
    been.want = @been == 'want'
    been.favorite = @been == 'favorite'
    
    been.save

    @user.beens << been

    if been.yes
      score = @user.place_score
    end

    render(:update) {|page|
      if score
        page.replace_html 'score-places', score.to_s
        page.visual_effect :highlight, 'score-places'
      end

      if been.favorite
        @place = Place.find(@place_id)
        page.insert_html :after, 'yourfavorites', :partial => 'favorite'
        page.visual_effect :highlight, "place-#{@place_id}"
      end

      if been.want
        @place = Place.find(@place_id)
        page.insert_html :after, 'wanttogotext', :partial => 'want'
        page.visual_effect :highlight, "place-#{@place_id}"
      end

      # Get a new thing and display it, TODO: helper function
      @place = Place.random
      page.replace_html 'question', :partial => 'place'
    }
  end

  def remove_place
    render(:update) {|page|
      fbsession = session[:facebook_session]
      @fbuser = fbsession.user
      @user   = User.find_or_create_by_facebook_user(@fbuser)

      been = @user.beens.find_by_place_id(params[:place_id])

      if been
        been.destroy
#        TODO: perform hiding
#        if !@user.beens.exists?(:want => true)
#          page.visual_effect :hide "place-#{params[:place_id]}"
#        end
      end
      page.remove "place-#{params[:place_id]}"
    }
  end

end
