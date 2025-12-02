# DailyTracker – Flutter Projekt

DailyTracker ist eine einfache Flutter-App, mit der Tagesziele (Soll-Werte) 
für Schritte, Schlaf, Wasser und Kalorien gesetzt und über den Tag hinweg 
Ist-Werte eingetragen werden können. Die App berechnet den Fortschritt und 
zeigt klar an, ob ein Tagesziel erreicht wurde.

## Funktionen

### Tagesziele festlegen
Benutzer können Soll-Werte definieren:
- Schritte
- Schlaf (in Stunden)
- Wasser (in Litern)
- Kalorien

### Ist-Werte hinzufügen
Ist-Werte können beliebig oft ergänzt werden, da sie automatisch zur bisherigen Tagesmenge addiert werden.

### Tagesstatistik anzeigen
Die Statistik zeigt:
- Soll-Wert
- Ist-Wert
- Offen (wenn noch etwas fehlt)
- **Ziel erreicht** (inkl. grünem Icon, wenn Ist ≥ Soll)

### Werte zurücksetzen
Alle Werte können per Button zurückgesetzt werden.

---

## Technische Umsetzung

- Flutter
- Dart
- `ChangeNotifier` + `AppState` als zentraler globaler Speicher
- Stateful Widgets dort, wo UI auf Änderungen reagieren soll (z. B. Statistik)
- Named Routes für Navigation
- Visuelle Rückmeldungen mit Icons & Snackbars

---

## Projektstruktur (Auszug)

lib/
│
├─ app_state.dart → globaler Zustand (ChangeNotifier)
├─ main.dart → App-Aufbau & Navigation
│
└─ screens/
├─ home_screen.dart
├─ sollwert_screen.dart
├─ input_screen.dart
└─ statistik_screen.dart