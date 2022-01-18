package net.base.utl.fcc;

import org.locationtech.proj4j.BasicCoordinateTransform;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.ProjCoordinate;

public class TransCoord {

  public static ProjCoordinate transform(String strLon, String strLat) {

    //parse to Double
    Double dblLon = Double.parseDouble(strLon);
    Double dblLat = Double.parseDouble(strLat);

    CRSFactory factory = new CRSFactory();
    CoordinateReferenceSystem grs80 = factory.createFromName("EPSG:5179");
    CoordinateReferenceSystem wgs84 = factory.createFromName("EPSG:4326");
    BasicCoordinateTransform transformer = new BasicCoordinateTransform(grs80, wgs84);

    ProjCoordinate beforeCoord = new ProjCoordinate(dblLon, dblLat);
    ProjCoordinate afterCoord = new ProjCoordinate();

    //변환된 좌표
    System.out.println(afterCoord.x + "," + afterCoord.y);
    //Map<String,Object> map = new HashMap<String,Object>();
    //map.put("lat", afterCoord.x);
    //map.put("lon", afterCoord.y);
    return transformer.transform(beforeCoord, afterCoord);
  }

}