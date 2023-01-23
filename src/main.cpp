#include <stdlib.h>
#include <string.h>
#include <httplib.h>
#include <iostream>

using std::cout;

int main(int argc, char *argv[]) {
  httplib::Client cli("https://eu.api.blizzard.com/");
  httplib::Headers headers = {
    { "Authorization", "Bearer EUE6H8GUpUmJKTO16UWeFmPtQUbMU615jW" }
  };

  httplib::Params params = {
    { "locale", "en_US" },
    { "textFilter", "give%20your%20minions"}
  };
  
  auto res = cli.Post("/hearthstone/cards", headers, params);
  cout << res->body;
  return 0;
}
