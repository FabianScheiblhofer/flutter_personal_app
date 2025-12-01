import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter_app/app.dart';

void main() {
  testWidgets('Counter erhöht sich bei Button-Klick', (tester) async {        //testWidgets() ist eine spezielle Funktion aus dem Paket flutter_test. //async --> damit man eben auf die bestimmten Schritte im Test warten kann.
    // App im Testmodus starten (isolierten Testumgebung)
    await tester.pumpWidget(const App());         //Baut meine Counter-App im Testmodus auf //await --> wartet darauf, dass die App vollständig aufgebaut ist.        

    // Anfangszustand prüfen
    expect(find.text('0'), findsOneWidget);     //finde 0  //Bitte prüfe, ob am Anfang eh 0 angezeigt wird. //findsOneWidget --> Finde GENAU EIN Text-Widget, das die Zahl 0 anzeigt.
    expect(find.text('1'), findsNothing);        //finde nicht 1 //Bitte prüfe, ob am Anfang eh nicht 1 angezeigt wird. //findsNothing --> Finde KEIN Text-Widget, das die Zahl 1 anzeigt.

    // Button mit dem Plus-Icon "virtuell" klicken
    await tester.tap(find.byIcon(Icons.add));       // Suche den Button mit dem Plus-Icon und simuliere einen Tap darauf
    await tester.pump();                            // Warte darauf, dass die UI aktualisiert wird nach dem Klick

    // Neuer Zustand prüfen: 1 wird angezeigt
    expect(find.text('1'), findsOneWidget);       //finde 1 //Bitte prüfe, ob nach dem Klick eh 1 angezeigt wird //findsOneWidget --> Finde GENAU EIN Text-Widget, das die Zahl 1 anzeigt.
    expect(find.text('0'), findsNothing);         //finde nicht 0 //Bitte prüfe, ob nach dem Klick eh nicht mehr 0 angezeigt wird //findsNothing --> Finde KEIN Text-Widget, das die Zahl 0 anzeigt.
  });
}
