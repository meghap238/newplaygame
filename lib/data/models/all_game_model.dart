class AllGameStaticModel{
  String? gameName;
  String? img;
  AllGameStaticModel( {
    required this.gameName,
    required this.img,
  });
}

List<AllGameStaticModel> allGmData = [
  AllGameStaticModel(gameName: 'Single Digit', img: 'assets/images/singleDigit.svg'),
  AllGameStaticModel(gameName: 'Single Digit Bulk', img: 'assets/images/singledigitbulk.svg'),
  AllGameStaticModel(gameName: 'Single Pana', img: 'assets/images/singlePana.svg'),
  AllGameStaticModel(gameName: 'Single Pana Bulk', img: 'assets/images/singlepanabulk.svg'),
  AllGameStaticModel(gameName: 'Double Pana', img: 'assets/images/doublepana.svg'),
  AllGameStaticModel(gameName: 'Double Pana Bulk', img: 'assets/images/doublepanabulk.svg'),
  AllGameStaticModel(gameName: 'Triple Pana', img: 'assets/images/triplepana.svg'),
  AllGameStaticModel(gameName: 'Triple Pana Bulk', img: 'assets/images/triplepanabulk.svg'),
];