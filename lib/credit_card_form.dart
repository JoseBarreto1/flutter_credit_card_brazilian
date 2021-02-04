import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card_brazilian/flutter_credit_card.dart';

import 'credit_card_model.dart';
import 'flutter_credit_card.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key key,
    this.cardNumber,
    this.cardName,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    this.localizedText = const LocalizedText(),
  })  : assert(localizedText != null),
        super(key: key);

  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;
  final LocalizedText localizedText;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  String cardNumber;
  String cardName;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;
  Color themeColor;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextController _cardNumberController =
      MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController =
      MaskedTextController(mask: '00/00');
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cvvCodeController =
      MaskedTextController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    cardName = widget.cardName ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';

    creditCardModel = CreditCardModel(cardName, cardNumber, expiryDate,
        cardHolderName, cvvCode, isCvvFocused);
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        cardName = getCardTypeName(cardNumber);
        creditCardModel.cardName = cardName;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvCodeController.addListener(() {
      setState(() {
        cvvCode = _cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  Map<CardType, Set<List<String>>> cardNumPatterns =
      <CardType, Set<List<String>>>{
    CardType.aura: <List<String>>{
      <String>['50'],
    },
    CardType.visa: <List<String>>{
      <String>['4'],
    },
    CardType.americanExpress: <List<String>>{
      <String>['34'],
      <String>['37'],
    },
    CardType.discover: <List<String>>{
      <String>['6011'],
      <String>['622126', '622925'],
      <String>['644', '649'],
      <String>['65']
    },
    CardType.mastercard: <List<String>>{
      <String>['51', '55'],
      <String>['2221', '2229'],
      <String>['223', '229'],
      <String>['23', '26'],
      <String>['270', '271'],
      <String>['2720'],
    },
    CardType.dinersclub: <List<String>>{
      <String>['30'],
      <String>['300', '305'],
      <String>['36'],
      <String>['38'],
      <String>['39'],
    },
    CardType.jcb: {
      <String>['3506', '3589'],
      <String>['2131'],
      <String>['1800'],
    },
    CardType.elo: {
      <String>['4011'],
      <String>['401178'],
      <String>['401179'],
      <String>['438935'],
      <String>['457631'],
      <String>['457632'],
      <String>['431274'],
      <String>['451416'],
      <String>['457393'],
      <String>['504175'],
      <String>['506699', '506778'],
      <String>['509000', '509999'],
      <String>['627780'],
      <String>['636297'],
      <String>['636368'],
      <String>['650031', '650033'],
      <String>['650035', '650051'],
      <String>['650405', '650439'],
      <String>['650485', '650538'],
      <String>['650541', '650598'],
      <String>['650700', '650718'],
      <String>['650720', '650727'],
      <String>['650901', '650978'],
      <String>['651652', '651679'],
      <String>['655000', '655019'],
      <String>['655021', '655058'],
      <String>['6555'],
    },
    CardType.hiper: {
      <String>['637095'],
      <String>['637568'],
      <String>['637599'],
      <String>['637609'],
      <String>['637612'],
    },
    CardType.assomise: {
      <String>['639595'],
      <String>['608732'],
    },
    CardType.fortbrasil: {
      <String>['628167'],
    },
    CardType.sorocred: {
      <String>['627892'],
      <String>['606014'],
      <String>['636414'],
    },
    CardType.realcard: {
      <String>['637176'],
    },
    CardType.hipercard: {
      <String>['6062'],
      <String>['384100'],
      <String>['384140'],
      <String>['384160'],
    },
    CardType.cabal: {
      <String>['60'],
      <String>['99'],
    },
    CardType.credishop: {
      <String>['603136'],
      <String>['603134'],
      <String>['603135'],
    },
    CardType.banese: {
      <String>['6366'],
      <String>['6361'],
      <String>['6374']
    }
  };

  String getCardTypeName(String cardNumber) {
    String name = '';
    switch (detectCCType(cardNumber)) {
      case CardType.visa:
        name = 'VISA';
        break;
      case CardType.americanExpress:
        name = 'AMEX';
        break;
      case CardType.mastercard:
        name = 'MASTERCARD';
        break;
      case CardType.discover:
        name = 'DISCOVER';
        break;
      case CardType.assomise:
        name = 'ASSOMISE';
        break;
      case CardType.aura:
        name = 'AURA';
        break;
      case CardType.dinersclub:
        name = 'DINERS';
        break;
      case CardType.fortbrasil:
        name = 'FORTBRASIL';
        break;
      case CardType.elo:
        name = 'ELO';
        break;
      case CardType.hiper:
        name = 'HIPER';
        break;
      case CardType.hipercard:
        name = 'HIPERCARD';
        break;
      case CardType.jcb:
        name = 'JCB';
        break;
      case CardType.sorocred:
        name = 'SOROCRED';
        break;
      case CardType.realcard:
        name = 'REALCARD';
        break;
      case CardType.cabal:
        name = 'CABAL';
        break;
      case CardType.banese:
        name = 'BANESECARD';
        break;
      case CardType.credishop:
        name = 'CREDISHOP';
        break;
      default:
        name = '';
        break;
    }
    return name;
  }

  CardType detectCCType(String cardNumber) {
    //Default card type is other
    CardType cardType = CardType.otherBrand;

    if (cardNumber.isEmpty) {
      return cardType;
    }

    cardNumPatterns.forEach(
      (CardType type, Set<List<String>> patterns) {
        for (List<String> patternRange in patterns) {
          // Remove any spaces
          String ccPatternStr =
              cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
          final int rangeLen = patternRange[0].length;
          // Trim the Credit Card number string to match the pattern prefix length
          if (rangeLen < cardNumber.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            // Convert the prefix range into numbers then make sure the
            // Credit Card num is in the pattern range.
            // Because Strings don't have '>=' type operators
            final int ccPrefixAsInt = int.parse(ccPatternStr);
            final int startPatternPrefixAsInt = int.parse(patternRange[0]);
            final int endPatternPrefixAsInt = int.parse(patternRange[1]);
            if (ccPrefixAsInt >= startPatternPrefixAsInt &&
                ccPrefixAsInt <= endPatternPrefixAsInt) {
              // Found a match
              cardType = type;
              break;
            }
          } else {
            // Just compare the single pattern prefix with the Credit Card prefix
            if (ccPatternStr == patternRange[0]) {
              // Found a match
              cardType = type;
              break;
            }
          }
        }
      },
    );

    return cardType;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextFormField(
                controller: _cardNumberController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.cardNumberLabel,
                  hintText: widget.localizedText.cardNumberHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _expiryDateController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.expiryDateLabel,
                  hintText: widget.localizedText.expiryDateHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextField(
                focusNode: cvvFocusNode,
                controller: _cvvCodeController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.cvvLabel,
                  hintText: widget.localizedText.cvvHint,
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (String text) {
                  setState(() {
                    cvvCode = text;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: TextFormField(
                controller: _cardHolderNameController,
                cursorColor: widget.cursorColor ?? themeColor,
                style: TextStyle(
                  color: widget.textColor,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.localizedText.cardHolderLabel,
                  hintText: widget.localizedText.cardHolderHint,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
