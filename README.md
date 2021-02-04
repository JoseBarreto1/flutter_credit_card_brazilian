# Flutter Credit Card Brazilian

Pacote Flutter que permite você implementar facilmente a IU do cartão de crédito com a detecção de cartão.

Bandeiras presentes no pacote:
*  mastercard,
*  visa,
*  americanExpress,
*  discover,
*  elo,
*  assomise,
*  dinersclub,
*  fortbrasil,
*  hiper,
*  hipercard,
*  jcb,
*  sorocred,
*  realcard,
*  aura,
*  credishop,
*  cabal,
*  banesecard,

## Preview

![O aplicativo de exemplo em execução no Android](https://github.com/JoseBarreto1/flutter_credit_card_brazilian/blob/master/preview/preview.gif)

## Instalando

1.  Adicionar dependência a `pubspec.yaml`

    *Obtenha a versão mais recente na guia 'Instalando' em pub.dartlang.org*
    
```dart
dependencies:
    flutter_credit_card_brazilian: 0.0.8
```

2.  Importe o pacote
```dart
import 'package:flutter_credit_card_brazilian/flutter_credit_card_brazilian.dart';
```

3.  Adicionando CreditCardWidget

*Parâmetros obrigatórios*
```dart

    CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate, 
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused, //true when you want to show cvv(back) view
    ),
```    
*Parâmetro opcionais*
```dart   
    CreditCardWidget(
        cardNumber: cardNumber,
        cardName: (String value) {
            print(value);
        },
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
3.  Adicionando CreditCardForm

```dart
    CreditCardForm(
      themeColor: Colors.red,
      onCreditCardModelChange: (CreditCardModel data) {},
    ),
```
## Retornos da função cardHolderName:
*  VISA
*  AMEX
*  MASTERCARD
*  DISCOVER
*  ASSOMISE
*  AURA
*  DINERS
*  FORTBRASIL
*  ELO
*  HIPER
*  HIPERCARD
*  JCB
*  SOROCRED
*  REALCARD
*  CABAL
*  BANESECARD
*  CREDISHOP

## Localização

Para localizar dicas e rótulos de campo de texto, use o modelo `LocalizedText`.

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

## Como usar
Verifique o aplicativo ** example ** no diretório [example] (example) ou a guia 'Example' em pub.dartlang.org para um exemplo mais completo.
