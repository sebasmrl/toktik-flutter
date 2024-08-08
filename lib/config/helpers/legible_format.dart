

Map<int, String> _shortNotationNumbers = {
  1: 'K',
  2: 'M',
  3: 'B',
  4: 'T'
};


/// @author Sebastian Morales;
class LegibleFormat{

  /// @param double [number].
  /// @return [String].
  static String readableNumber(double number) {
    if(number<1000) return number.toString().split('.')[0];

    String strNumber = '$number';
    String integerFragment = strNumber.split('.')[0];
    int divisions = integerFragment.length ~/3;
    int rest = integerFragment.length %3;
    String decimal = integerFragment.substring(integerFragment.length-divisions*3, (integerFragment.length-divisions*3)+1 );

    if(decimal == '0' && rest ==0) return '${integerFragment.substring(0, integerFragment.length-(divisions-1)*3)}${_shortNotationNumbers[divisions]}'; 
    if( rest ==0){ 
      String decimalVariant = integerFragment.substring(integerFragment.length-((divisions-1)*3), (integerFragment.length-((divisions-1)*3))+1 );
      return '${integerFragment.substring(0, integerFragment.length-(divisions-1)*3)}.$decimalVariant${_shortNotationNumbers[divisions]}'; 
    }

    return (decimal == '0' && rest !=0)
        ? '${integerFragment.substring(0, integerFragment.length-divisions*3)}${_shortNotationNumbers[divisions]}'
        : '${integerFragment.substring(0, integerFragment.length-divisions*3)}.$decimal${_shortNotationNumbers[divisions]}';
  }
}