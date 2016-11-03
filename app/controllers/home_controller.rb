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
  def user_pic_upload #프로필
  # 사진 설정용 메소드 
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
      @oth_img=Userpic.where(user_id: current_user,main: true)
      @oth_img.each do |p|
        p.main=false
        p.save
      end
    p_image.main=true
    p_image.save

    current_user.img_poa=true
    current_user.save
    
    flash[:notice] = "전송되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to :back
  end
  
  def add_team
    #팀을 생성하는데 학교 집어넣고 이름 집어넣고 설명 집어넣고 만들어짐
    @teams =Team.new(school_id: params[:school] ,name: params[:team_name], intro_text: params[:intro_text], deadline: params[:deadline_date])
    @teams.save
    #관계 테이블을 생성하는데 생성자의 아이디와 만들어진 팀의 아이디 그리고 권한을 개설자로 생성 후 저장
    user_team= UserTeam.new(user_id:current_user.id, team_id: @teams.id, power: 3)
    user_team.save
    flash[:notice] = "팀이 생성되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to "/home/index"
    
  end
  def team_page_vm
    @team= Team.find(params[:id])
    upcount=UserTeam.find_by(user_id:current_user.id, team_id: @team.id)
    upcount.count+=1
    upcount.save
    @every_post= Post.where(team_id: params[:id],tag: "").order("id desc")
  end
   def team_page_vm_sche
    @team= Team.find(params[:id])
  end
   def team_page_vm_post
    @team= Team.find(params[:id])
    @every_post= Post.where(team_id: params[:id],tag: "공지사항").paginate(:page => params[:page], :per_page => 10).order("id desc")
  end
  def team_page_vm_check
    @team= Team.find(params[:id])
  end
  def team_page_vm_graph
    @team= Team.find(params[:id])
  end
  def team_page_bor
    @team= Team.find(params[:id])
  end
  def delete_team
    # a는  Team 테이블에서 삭제
    a = Team.find(params[:id])
    a.delete
    # b는 UserTeam 관계테이블에서 삭제 find_by는 한 행만 찾기 때문에 where을 사용해서 모든 행을 검사하고 do end문으로 다 삭제함
    @b = UserTeam.where(team_id: params[:id])
      @b.each do |b|
        b.delete
      end
    redirect_to :back
  end
  
  def join_team
    #관계 테이블을 생성하는데 생성자의 아이디와 만들어진 팀의 아이디 그리고 권한을 개설자로 생성 후 저장
    user_team2= UserTeam.new(user_id: current_user.id, team_id: params[:id], power: 1)
    user_team2.save
    
     Schedule.where(team_id: user_team2.team_id).each do |s|
        att = Attendance.new(schedule_id: s.id, user_id: current_user.id, status: 3)
        att.save  
      end
    
    flash[:notice] = "팀이 생성되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to "/home/index"
  end
  
  def team_schedule
    #팀의 일정 생성하는 부분
    @sche =Schedule.new(name: params[:sche_name] ,position: params[:sche_posi] ,date: params[:sche_date] ,time: params[:sche_time] ,team_id: params[:id])
    @sche.save
    
     UserTeam.where(team_id: params[:id]).each do |u|
      att = Attendance.new(schedule_id: @sche.id, user_id: u.user_id, status: 3)
      att.save
    end
    
    flash[:notice] = "팀이 생성되었습니다."#전송 흔적 남기기 휘발성임
    redirect_to :back
    
  end
 def write #게시판 글 작성하기
        @team= Team.find(params[:team_id])
        new_post = Post.new
        new_post.user_id = current_user.id
        new_post.team_id = params[:team_id]
        new_post.name= params[:title]
        new_post.tag=params[:tag]
        new_post.content = params[:content]
        
        
        new_post.save
        
       
        redirect_to "/home/team_page_vm_post/#{@team.id}"
        
  end
   def write_wall #게시판 글 작성하기
        @team= Team.find(params[:team_id])
        new_post = Post.new
        new_post.user_id = current_user.id
        new_post.team_id = params[:team_id]
        new_post.name= params[:title]
        new_post.tag=params[:tag]
        new_post.content = params[:content]
        unless params[:pic]== nil
          uploader = PicUploader.new
          uploader.store!(params[:pic])
          str=uploader.url
          str["https:/"] ="https://"
          
          new_post.image_url = str
        end
        new_post.save
        redirect_to "/home/team_page_vm/#{@team.id}"
        
  end
   def view_of_write_vm
    @team= Team.find(params[:team_id])
  end
  def reply_write #게시판 댓글 작성하기
        new_reply = PostReply.new
        new_reply.user_id = current_user.id
        new_reply.content = params[:content]
        new_reply.post_id = params[:id_of_post]
        new_reply.save
        redirect_to :back
  end      
  
  def show_post ## 클릭한 글의 내용을 보이는 페이지로 이동함
    @one_post=Post.find(params[:post_id])
    @team= Team.find(@one_post.team_id)
  end
  
  def destroy
    @one_post = Post.find(params[:post_id])
    @team= Team.find(@one_post.team_id)
    unless current_user.id == @one_post.user_id
      flash[:error] = "본인이 작성한 게시글만 삭제할 수 있습니다."
      redirect_to "/home/team_page/#{@team.id}"
      return
    end
    
    @one_post.destroy
    
    redirect_to "/home/team_page_vm_post/#{@team.id}"
  end
  def destroy_wall
    @one_post = Post.find(params[:post_id])
    @team= Team.find(@one_post.team_id)
    @one_post.destroy
    
    redirect_to :back
  end
  def destroy_rp
    @one_rp = PostReply.find(params[:post_id])
    @team= Team.find(@one_rp.post.team_id)

    @one_rp.destroy
    redirect_to :back
  end
   
  def update_view
    @one_post = Post.find(params[:id])
  end 
  
  def real_update
    @one_post = Post.find(params[:id])
    @one_post.name =params[:title]
    @one_post.content = params[:content]
    @one_post.save
    
    redirect_to "/home/team_page/#{@one_post.team_id}"
  end
  
  # 좋아요 기능
  def favorite
    if Favorite.exists?(user_id: current_user.id,post_id: params[:id_of_post])
      fav=Favorite.find_by(user_id: current_user.id,post_id: params[:id_of_post])
      fav.delete
      
    else
      fav = Favorite.new
      fav.user_id = current_user.id
      fav.post_id = params[:id_of_post]
      fav.save
         
    end
    
  end
  
  def edit_atten
    
    s=Schedule.where(team_id: params[:team_id]).order("date desc").first
    Attendance.where(schedule_id: s.id).all.each do |a|
      
      a.status = params[:"#{a.user_id}"]
      a.save
    end
    redirect_to "/home/team_page_vm_check/#{params[:team_id]}"
   
  end
  
   def borrow
      t1=params[:start_time]
      t2=params[:end_time]
      if t2[1]==":"&&t1[1]==":"
        cnt=t2.first.to_i-t1.first.to_i
        elsif t2[1]==!":"&&t1[1]==":"
        cnt=t2[0,2].to_i-t1.first.to_i
        elsif t2[1]==":"&&t1[1]==!":"
        cnt=t2.first.to_i-t1[0,2].to_i
        else
        cnt=t2[0,2].to_i-t1[0,2].to_i
      end
      nnum=BNum.new(st: t1.first.to_i, et:t2.first.to_i, count: cnt,team_id: params[:team_id])
      nnum.save
      redirect_to "/home/team_page_bor/#{params[:team_id]}"
  end
  def destroy_sch
    @one_sch = Schedule.find(params[:id])
    @one_sch.destroy
    @one_sch.attendances.each do |a|
      a.destroy
    end
    
    redirect_to :back
  end
  def drop_team
    # a는  Team 테이블에서 삭제
    a = Team.find(params[:id])
    b=UserTeam.find_by(user_id: current_user.id, team_id: a.id)
    b.delete
    # b는 UserTeam 관계테이블에서 삭제 find_by는 한 행만 찾기 때문에 where을 사용해서 모든 행을 검사하고 do end문으로 다 삭제함
    @b = UserTeam.where(team_id: params[:id])
      @b.each do |b|
        b.delete
      end
    redirect_to :back
  end
  
  
end