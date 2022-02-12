// ignore_for_file: avoid_void_async

import 'dart:async';
import 'dart:io';
import 'package:at_client/src/service/sync_service.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_lookup/at_lookup.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class BackendService {
  BackendService._internal();

  factory BackendService.getInstance() {
    return _singleton;
  }
  static final BackendService _singleton = BackendService._internal();

  late AtClientService atClientServiceInstance;
  late AtClientImpl atClientInstance;
  late String atSign;
  // ignore: non_constant_identifier_names
  late String app_lifecycle_state;
  late AtClientPreference atClientPreference;
  bool autoAcceptFiles = false;
  String get currentAtsign => atSign;
  late OutboundConnection monitorConnection;
  late Directory downloadDirectory;
  late SyncService syncService;
  Map<String?, AtClientService> atClientServiceMap = {};
  bool isSyncedDataFetched = false;

  ///Resets [atsigns] list from device storage.
  Future<void> resetAtsigns(List<String> atsigns) async {
    for (final atsign in atsigns) {
      await KeychainUtil.resetAtSignFromKeychain(atsign);
      atClientServiceMap.remove(atsign);
    }
  }

  Future<AtClientPreference> getAtClientPreference() async {
    final appDocumentDirectory =
        await path_provider.getApplicationSupportDirectory();
    final path = appDocumentDirectory.path;
    final _atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..rootDomain = Constants.rootDomain
      ..namespace = Constants.appNamespace
      ..syncRegex = Constants.syncRegex
      ..hiveStoragePath = path;
    return _atClientPreference;
  }

  Future<List<String>?> getAtsignList() async {
    final KeyChainManager _keyChainManager = KeyChainManager.getInstance();
    final atSignsList = await _keyChainManager.getAtSignListFromKeychain();
    return atSignsList;
  }

  void syncWithSecondary() async {
    isSyncedDataFetched = false;
    syncService = AtClientManager.getInstance().syncService;
    syncService.sync();
    // syncService.setOnDone(_onSuccessCallback);
  }
}
