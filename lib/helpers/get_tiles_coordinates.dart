import 'dart:math';
import 'dart:core';

List<int> getTilesCoordinates(List<double> geoCoords) {
  const double eccentricity = 0.0818191908426;
  const int z = 19;

  List<int> fromGeoToPixels(double eccentricity) {
    double e = eccentricity;

    num rho = pow(2, z + 8) / 2;
    dynamic beta = geoCoords[0] * pi / 180;
    num phi = (1 - e * sin(beta)) / (1 + eccentricity * sin(beta));
    double theta = tan(pi / 4 + beta / 2) * pow(phi, eccentricity / 2);

    num xPoint = rho * (1 + geoCoords[1] / 180);
    num yPoint = rho * (1 - log(theta) / pi);

    int xTile = (xPoint / 256).floor();
    int yTile = (yPoint / 256).floor();

    return [
      xTile,
      yTile,
    ];
  }

  var tileNumber = fromGeoToPixels(eccentricity);

  return tileNumber;
}
