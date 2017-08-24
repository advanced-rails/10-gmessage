Message.delete_all
User.delete_all

u1 = User.create!(email: 'bob@aol.com', password: 'pass1234')
u2 = User.create!(email: 'sam@aol.com', password: 'pass1234', color: '#00FFFF', photo: 'https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png')
u3 = User.create!(email: 'sue@aol.com', password: 'pass1234', color: '#FF00FF', photo: 'https://cdn.vectorstock.com/i/thumb-large/04/40/4340440.jpg')

Message.create!(from_id: u1.id, to_id: u2.id, subject: '01', body: 'B1')
Message.create!(from_id: u1.id, to_id: u3.id, subject: '02', body: 'B2')
Message.create!(from_id: u3.id, to_id: u1.id, subject: '03', body: 'B3')
Message.create!(from_id: u2.id, to_id: u1.id, subject: '04', body: 'B4')
