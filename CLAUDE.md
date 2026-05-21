# CLAUDE.md

Rails Engine pour bannière de consentement cookies GDPR.

## Structure

```
app/views/immosquare-cookies/_consent_banner.html.erb  # Partial principal (ERB + JS inline)
app/assets/stylesheets/immosquare-cookies.scss         # Styles avec CSS custom properties
config/locales/*.yml                                   # Traductions (8 langues : fr, en, es, it, nl, pl, zh, zh-TW)
lib/immosquare-cookies/engine.rb                       # Rails Engine
lib/immosquare-cookies/version.rb                      # Constante VERSION
```

## Implémentation

- **Rendu conditionnel** : la bannière ne s'affiche que si `cookies[cookie_name].blank?` (condition `if` en fin de partial)
- **Suppression cookies** : le JS supprime les cookies sur plusieurs variations de domaine (actuel, `.example.com`, `.example.co.uk`)
- **Paramètres** : utilise `defined?()` pour vérifier les variables locales passées au partial
- **Compatibilité Turbo Drive** : script en IIFE (pas `DOMContentLoaded` — Turbo remplace `<body>` sans refirer l'event)
- **Google Consent Mode v2** : si `gtag` est défini, appelle `gtag('consent', 'update', ...)` avec les 4 signaux requis (`analytics_storage`, `ad_storage`, `ad_user_data`, `ad_personalization`)

## Conventions

- JavaScript inline dans l'ERB (zéro dépendance externe)
- SCSS plat avec `color-mix()` natif CSS (pas de compilateur Dart Sass requis depuis 2.0.5)
- Pas de tests (gem minimaliste)
