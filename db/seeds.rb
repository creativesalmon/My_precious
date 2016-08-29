# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.create([
    { name: '소속 없음' },
    { name: '강원대' },
    { name: '경북대' },
    { name: '경희대' },
    { name: '건국대' },
    { name: '고려대' },
    { name: '국민대' },
    { name: '단국대' },
    { name: '동국대' },
    { name: '동덕여대' },
    { name: '부산대' },
    { name: '서강대' },
    { name: '서울과기대' },
    { name: '서울대' },
    { name: '서울시립대' },
    { name: '서울여대' },
    { name: '성균관대 ' },
    { name: '성신여대' },
    { name: '숙명여대' },
    { name: '연세대' },
    { name: '영남대' },
    { name: '원광대' },
    { name: '이화여대' },
    { name: '전남대' },
    { name: '중앙대' },
    { name: '충남대' },
    { name: '평택대' },
    { name: '한양대' },
    { name: 'KAIST' },
    { name: 'UNIST' },
])
Borrow.create([
    { content: '스터디',weight: '1' },
    { content: '사전 모임',weight: '2' },
    { content: '오리엔테이션',weight: '2' },
    { content: '모의 시험',weight: '2' },
    { content: '팀별 토의',weight: '2' },
    { content: '인사말',weight: '2' },
    { content: '교재 스터디',weight: '3' },
    { content: '아이디어 회의하기',weight: '3' },
    { content: '팀별 기획회의하기',weight: '3' },
    { content: '신문 스터디',weight: '3' },
    { content: '자료조사 ',weight: '3' },
     { content: '자료 검색',weight: '3' },
    { content: '책 스터디',weight: '3' },
    { content: '기획 정리 후 발표',weight: '4' },
    { content: '팀별 스터디 소감 발표',weight: '4' },
    { content: '팀 별 아이디어 발표',weight: '4' },
     { content: '폐회사',weight: '4' }
    
])