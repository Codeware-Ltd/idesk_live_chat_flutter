library idesk_live_chat;

class IDeskLiveChatConfig {
  final String resourceUri;
  final String appUri;
  final String pageId;
  final Map<String, dynamic> miscellaneous;
  final Map<String, dynamic> customerInfo;

  IDeskLiveChatConfig({
    required this.resourceUri,
    required this.appUri,
    required this.pageId,
    required this.miscellaneous,
    required this.customerInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'resource_uri': resourceUri,
      'app_uri': appUri,
      'page_id': pageId,
      'miscellaneous': (miscellaneous),
      'customerInfo': (customerInfo)
    };
  }

  factory IDeskLiveChatConfig.fromMap(Map<String, dynamic> map) {
    return IDeskLiveChatConfig(
      resourceUri: map['resource_uri'],
      appUri: map['app_uri'],
      pageId: map['page_id'],
      miscellaneous: Map<String, dynamic>.from(map['miscellaneous']),
      customerInfo: Map<String, dynamic>.from(map['customerInfo']),
    );
  }
}
