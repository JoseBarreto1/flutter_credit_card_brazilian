class CreditCardModel {
  CreditCardModel(this.cardNumber, this.cardName, this.expiryDate,
      this.cardHolderName, this.cvvCode, this.isCvvFocused);

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cardName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
}
