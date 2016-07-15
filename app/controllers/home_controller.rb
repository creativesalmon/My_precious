class HomeController < ApplicationController
  
  
  def index
    unless user_signed_in?
      redirect_to "/users/sign_in"
    else
      user = current_user.gender
      case user
        when 1
          @gender = 'Male.png'
        when 2
          @gender = 'Female.png'
      end
    end
  end
  def view
  end
  def upload
    file= params[:pic]
    uploader = PicUploader.new #업로더라는 이름으로 좀업로더 객체 생성
    uploader.store!(file)
    flash[:notice] = "전송되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to "/home/index"

  end
  def user_pic_upload #프로필사진 설정용 메소드 
    file= params[:image] # name= image연결해서
    uploader = UserpicUploader.new 
    uploader.store!(file) 
    user_id = current_user.id 
    p_image=Userpic.new #Userpic이라는 테이블 생성 Userpic은 그 사용자의 프로필사진들 설정함
    p_image.user_id=user_id
    p_image.profile_img=uploader.url
    str=p_image.profile_img
    str["https:/"] ="https://"
    p_image.profile_img=str
      @oth_img=Userpic.where(main: true)
      @oth_img.each do |p|
        p.main=false
        p.save
      end
    # p_image.main=true
    p_image.save
    # current_user.level=2
    current_user.img_poa=true
    current_user.save
    
    flash[:notice] = "전송되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to "/home/index"
  end
  
  def add_team
    #팀을 생성하는데 학교 집어넣고 이름 집어넣고 설명 집어넣고 만들어짐
    @teams =Team.new(school_id: params[:school] ,name: params[:team_name], intro_text: params[:intro_text])
    @teams.save
    #관계 테이블을 생성하는데 생성자의 아이디와 만들어진 팀의 아이디 그리고 권한을 개설자로 생성 후 저장
    user_team= UserTeam.new(user_id:current_user.id, team_id: @teams.id, power: 3)
    user_team.save
    flash[:notice] = "팀이 생성되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to "/home/index"
    
  end
 
end