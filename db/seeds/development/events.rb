# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require Rails.root.join('db', 'seeds', 'support', 'event_seeder')

srand(42)

seeder = EventSeeder.new

# seeder.course_group_ids.each do |group_id|
#   10.times do
#     seeder.seed_event(group_id, :course)
#     seeder.seed_event(group_id, :base)
#   end
# end

# Abos

MailingList.create(
  { name: 'Unisono',
    group: Group.find(1),
    description: 'Unsere Mitgliederzeitschrift',
    publisher: 'SBV'
  }
)

b = MailingList.create(
  { name: 'SBV-Newsletter',
    group: Group.find(1),
    description: 'Unser Newsletter',
    publisher: 'SBV',
    mail_name: 'newsletter'
  }
)
b.update!(subscriptions: [17, 33].map {|d| Subscription.new({ subscriber: Person.find(d) })})

# Mitgliedschaften
Person.find(16).update!(birthday: Date.new(1930, 3, 1))
Person.find(16).roles.push(Role.new({group: Group.find(26), created_at: Time.new(1940,3,1), type: 'Group::Local::Leader', deleted_at: Time.new(1950, 3,1)}))
Person.find(16).roles.push(Role.new({group: Group.find(26), created_at: Time.new(1950,3,1), type: 'Group::Local::ActiveMember', deleted_at: Time.new(1970, 3,1)}))
Person.find(16).roles.first.update!(created_at: Time.new(1970,3,1))

Qualification.create!({ person: Person.find(16), qualification_kind: QualificationKind.find(1), start_at: Time.new(1975,3,1)})
Qualification.create!({ person: Person.find(16), qualification_kind: QualificationKind.find(2), start_at: Time.new(2010,3,1)})

