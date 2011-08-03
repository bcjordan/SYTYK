require 'pp'

class FacebookController < ApplicationController
  ensure_authenticated_to_facebook

  def canvas
    fbsession = session[:facebook_session]

    @fbuser = fbsession.user
    @user   = User.find_or_create_by_facebook_user(@fbuser)

    fbsession = session[:facebook_session]

    @count = 0
    @fbuser.friends.each do |friend|
      @count += 1
    end

    @name = @user.name
    @pic  = @user.pic_square_with_logo


    
    #pp fbsession.user

    #pp fbsession
  end

  def submit_answer_ajax

    pp @question.answer
    pp @answer_id
    # Return JS
    #   that shakes answer,
    #   calls 
  end

  def next_question
    pp params
    @question_id = params[:question_id]
    @answer_id   = params[:answer_id]
    @question    = Question.find(@question_id)
    @correct     = @question.answer.to_s == @answer_id

    @answer_element = "answer#{@answer_id}"
    
    render(:update) {|page|
      if (!@correct)
        page.visual_effect :highlight, @answer_element, :startcolor => "#eceff6", :endcolor => "#ffebe8",
                                                        :restorecolor => "#eceff6"
        page.visual_effect :shake, @answer_element
      else
        #
        # Celebrate, update page
        #
        page.replace_html 'question', :partial => 'question'
      end
    }
  end

end
