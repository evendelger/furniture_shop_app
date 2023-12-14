abstract class SvgPaths {
  static const _foldPath = 'assets/icons/';

  static const appIcon = '${_foldPath}app_icon.svg';
  static const search = '${_foldPath}search.svg';
  static const shoppingCart = '${_foldPath}shopping_cart.svg';
  static const exit = '${_foldPath}exit.svg';

  static getByName(String iconName) => '$_foldPath$iconName.svg';
}

abstract class ImagePaths {
  static const _foldPath = 'assets/images/';

  static const startPhoto = '${_foldPath}start_photo.png';
  static const avatar = '${_foldPath}avatar.png';
}
