# Flutter Credit Card

A Flutter package allows you to easily implement the Credit card's UI easily with the Card detection.


## Preview

![The example app running in Android](https://github.com/JoseBarreto1/flutter_credit_card_brazilian/blob/master/preview/preview.gif)

## Installing

1.  Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*
    
```dart
dependencies:
    flutter_credit_card_brazilian: 0.0.1
```

2.  Import the package
```dart
import 'package:flutter_credit_card_brazilian/flutter_credit_card_brazilian.dart';
```

3.  Adding CreditCardWidget

*With required parameters*
```dart

    CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate, 
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused, //true when you want to show cvv(back) view
    ),
```    
*With optional parameters*
```dart   
    CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused,
        cardbgColor: Colors.black,
        height: 175,
        textStyle: TextStyle(color: Colors.yellowAccent),
        width: MediaQuery.of(context).size.width,
        animationDuration: Duration(milliseconds: 1000),
        ),
``` 
3.  Adding CreditCardForm

```dart
    CreditCardForm(
      themeColor: Colors.red,
      onCreditCardModelChange: (CreditCardModel data) {},
    ),
```

## Localization

To localize text field hints and labels, use `LocalizedText` model.

```dart
const LocalizedText localizedText = LocalizedText(
    cardNumberLabel: 'Kreditkartennummer',
    cardNumberHint: 'XXXX-XXXX-XXXX-XXXX',
    expiryDateLabel: 'Ablaufdatum',
    expiryDateHint: 'MM/JJ',
    cvvLabel: 'Kartenprüfnummer',
    cvvHint: 'XXX',
    cardHolderLabel: 'Karteninhaber',
    cardHolderHint: 'Max Mustermann',
);

return Column(
    children: <Widget>[
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            localizedText: localizedText,
        ),
        Expanded(
        child: SingleChildScrollView(
            child: CreditCardForm(
                onCreditCardModelChange: onCreditCardModelChange,
                localizedText: localizedText,
            ),
        ),
    ],
);
```

## How to use
Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

## Credit

This package's animation is inspired from from this [Dribbble](https://dribbble.com/shots/2187649-Credit-card-Checkout-flow-AMEX) art.
