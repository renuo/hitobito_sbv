# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

CustomContent.seed(:key,
  {key: 'views/devise/sessions/info',
   placeholders_required: nil,
   placeholders_optional: nil},
)

login_form_id = CustomContent.get('views/devise/sessions/info').id

CustomContent::Translation.seed(:custom_content_id, :locale,

  {custom_content_id: login_form_id,
   locale: 'de',
   label: 'Login Informationen',
   body: "<h2>Demo Version</h2>\
<p>Sie können sich mit den folgenden E-Mail-Adressen anmelden:</p>\
<ul>\
  <li>admin@sbv.ch (Passwort: demo) - Administrator mit vollem Zugriff</li>\
  <li>leitung@sbv.ch (Passwort: demo) - Rolle Leitung einer lokalen Sektion</li>\
  <li> mitglied@sbv.ch (Passwort: demo) - Einfaches Sektionsmitglied</li>\
</ul\>
<br/>\
<p>\
    Die Demo-Daten werden jeden Abend neu eingespielt. Falls Sie Probleme mit dem Login haben,\
    wenden Sie sich an Simon Huber (<a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>).\
</p>\
<p>Bei Fragen wenden Sie sich an <a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>.</p>" },

  {custom_content_id: login_form_id,
   locale: 'fr',
   label: 'Informations au login',
   body: "<h2>Version Démo</h2>\
<p>Vous pouvez vous inscrire avec les adresses e-mail suivantes:</p>\
<ul>\
  <li>admin@sbv.ch (mot de passe: demo) - administrateur avec access complet</li>\
  <li>leitung@sbv.ch (mot de passe: demo) - rôle responsable d'une groupe locale</li>\
  <li> mitglied@sbv.ch (mot de passe: demo) - membre d'une groupe</li>\
</ul\>
<br/>\
<p>\
  Les dates démo sont remis tous les soirs. Si vous avez des problèmes avec l'inscription,
  n'hésitez pas à contacter Simon Huber (<a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>).\
</p>\
<p>En cas de questions vous pouvez écrire à <a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>.</p>"},

  {custom_content_id: login_form_id,
   locale: 'en',
   label: 'Login Information',
   body: "<h2>Demo Version</h2>\
<p>You may login with the following email addresses:</p>\
<ul>\
  <li>admin@sbv.ch (password: demo) - administrator with full access</li>\
  <li>leitung@sbv.ch (password: demo) - leader of a local group</li>\
  <li> mitglied@sbv.ch (password: demo) - simple group member</li>\
</ul\>
<br/>\
<p>\
  The demo data is reset every night. If you have problems with the login,
  please contact Simon Huber (<a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>).\
</p>\
<p>In the case of other questions please write to <a href='mailto:simon.huber@renuo.ch'>simon.huber@renuo.ch</a>.</p>"}

)
