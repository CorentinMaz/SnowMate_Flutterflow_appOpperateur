import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? dateConverter(int? inputDate) {
  if (inputDate == null) {
    return "Aucune";
  }

  DateTime date = DateTime.fromMillisecondsSinceEpoch(inputDate);

  // Déterminer si c'est AM ou PM
  String amPm = date.hour >= 12 ? "PM" : "AM";

  // Convertir l'heure en format 12 heures
  int hour = date.hour > 12 ? date.hour - 12 : date.hour;
  if (hour == 0) hour = 12; // 0h correspond à 12 AM

  // Formater la date dans un format lisible (ex. "dd/MM/yyyy hh:mm AM/PM")
  String formattedDate =
      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${hour}h${date.minute.toString().padLeft(2, '0')} $amPm";

  return formattedDate;
}

bool isWithinOneHourOrPast(int timestamp) {
  // Obtenez l'heure actuelle en millisecondes
  final int currentTime = DateTime.now().millisecondsSinceEpoch;

  // Calculez l'heure 1h avant le timestamp
  final int oneHourBeforeTimestamp = timestamp - 60 * 60 * 1000;

  // Vérifiez si l'heure actuelle est valide
  final result =
      currentTime >= oneHourBeforeTimestamp && currentTime >= timestamp;

  return result;
}

String convertMinutesToHours(int totalMinutes) {
  int hours = totalMinutes ~/ 60; // Division entière pour obtenir les heures
  int minutes = totalMinutes % 60; // Modulo pour obtenir les minutes restantes

  // Si pas d'heures, afficher uniquement les minutes
  if (hours == 0) {
    return "${minutes}min"; // Affiche seulement les minutes
  }

  // Sinon, afficher heures et minutes
  return "${hours}h ${minutes}min";
}

dynamic updateSnowOperation(
  dynamic operation,
  int step,
  String? clientsId,
) {
  switch (step) {
    case 1:
      // Modifier .isConfirmed à true
      operation["isConfirmed"] = true;
      break;
    case 2:
      // Modifier .isStart à true
      operation["isStart"] = true;
      break;
    case 3:
      // Modifier .done à true pour l'élément avec clients_id correspondant
      if (clientsId != null && operation["adresses"] != null) {
        List<dynamic> adresses = operation["adresses"];
        for (var adresse in adresses) {
          if (adresse["clients_id"] == clientsId) {
            adresse["done"] = true;
            break; // Sortir de la boucle après avoir trouvé et modifié l'élément
          }
        }
        operation["nbAdressesDone"] = operation["nbAdressesDone"] + 1;
      }
      break;
    default:
      // Si l'étape n'est pas reconnue, retourne l'opération inchangée
      return {};
  }
  return operation; // Retourne le JSON mis à jour
}

bool isWithinProximity(
  LatLng currentLocation,
  double targetLat,
  double targetLng,
) {
  const double earthRadius = 6371000; // Rayon de la Terre en mètres

  // Extraire la latitude et longitude du type LatLng
  double currentLat = currentLocation.latitude;
  double currentLng = currentLocation.longitude;

  double dLat = (targetLat - currentLat) * math.pi / 180.0;
  double dLng = (targetLng - currentLng) * math.pi / 180.0;

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(currentLat * math.pi / 180.0) *
          math.cos(targetLat * math.pi / 180.0) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  double distance = earthRadius * c;

  // Retourne true si la distance est inférieure ou égale au rayon
  return distance <= 8;
}

dynamic getFirstIncompleteAddress(List<dynamic> adresses) {
  for (var address in adresses) {
    if (address['done'] == false) {
      return address;
    }
  }
  // Retourne null si aucun élément avec `done == false` n'est trouvé
  return null;
}

List<dynamic> convertLatLngToJson(List<LatLng> locations) {
  return locations.map((LatLng location) {
    return {"lat": location.latitude, "lng": location.longitude};
  }).toList();
}

dynamic updateCurrentLocation(
  LatLng currentLocation,
  dynamic lastElement,
  bool isWithinZone,
) {
  Map<String, dynamic> result = {
    "location": {
      "lat": currentLocation.latitude,
      "lng": currentLocation.longitude,
    },
    "zone": "NAN",
  };

  // Vérifier si un dernier élément est fourni
  if (lastElement == null) {
    // Pas d'élément précédent : première utilisation
    result["zone"] = isWithinZone ? "IN" : "NAN";
  } else {
    // Récupérer l'état actuel de la zone depuis l'élément précédent
    String currentZone = lastElement["zone"] ?? "NAN";

    // Mise à jour en fonction des conditions
    if ((currentZone == "IN" || currentZone == "NAN" || currentZone == "OUT") &&
        isWithinZone) {
      result["zone"] = "IN";
    } else if (currentZone == "IN" && !isWithinZone) {
      result["zone"] = "OUT";
    } else if ((currentZone == "OUT" || currentZone == "NAN") &&
        !isWithinZone) {
      result["zone"] = "NAN";
    }
  }

  return result;
}
