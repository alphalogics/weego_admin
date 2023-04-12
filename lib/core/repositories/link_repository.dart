import '../api/base_repository.dart';
import '../api/urls.dart';
import '../models/requests/links_request.dart';
import '../models/responses/links_response.dart';

abstract class LinkRepository {
  Future<LinksResponse> saveLinks(LinksRequest request);
  Future<LinksResponse> getLinks();
}

class LinkRepositoryImpl extends BaseRepository implements LinkRepository {

  @override
  Future<LinksResponse> saveLinks(LinksRequest request) async {
    var response = await client.post(URLs.saveLinks, body: request);
    return LinksResponse.fromJson(response);
  }

  @override
  Future<LinksResponse> getLinks() async {
    var response = await client.get(URLs.getLinks);
    return LinksResponse.fromJson(response);
  }

}