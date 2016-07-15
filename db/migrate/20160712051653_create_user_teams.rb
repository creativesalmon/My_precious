class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.integer        :user_id
      t.integer        :team_id
      t.integer        :power,default:1 #권한 레벨 아직 구체적이진 않으나 3이면 개설자 2면 운영자 1이면 일반 가입자로 생각중
      t.timestamps null: false
    end
  end
end