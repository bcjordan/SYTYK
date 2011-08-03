require 'pp'

class FacebookController < ApplicationController
  ensure_authenticated_to_facebook

  def canvas
    fbsession = session[:facebook_session]
    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)
    pp "USER IS ", @user

    fbsession = session[:facebook_session]

    @count = 0
    @fbuser.friends.each do |friend|
      @count += 1
    end

    @name = @user.name
    @pic  = @user.pic_square_with_logo

    q = Question.random
    @question = q unless Answer.exists?(:question_id => q.id, :user_id => @user.id)
    @place = Place.random
  end

  def next_question
        fbsession = session[:facebook_session]
    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)
    pp params
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
          user_score = @user.answers.count(:conditions => {:user_id => @user.id, :correct => true})
          page.replace_html 'score-answers', user_score
          page.visual_effect :highlight, 'score-answers'
        end

        @question = Question.random
        page.replace_html 'question', :partial => 'question'
      end
    }
  end

end
