class Main {
    static function main() {
        trace("Haxe is great!");
        var voltorb_url = "https://pokeapi.co/api/v2/pokemon/voltorb";
        var req = new haxe.Http(voltorb_url);

        req.onData = function(data) {
            trace("onData");
            var pokemon = haxe.Json.parse(data);
            trace(pokemon.name);
            trace(pokemon.weight);
            trace(pokemon.height);
        }

        req.onError = function(error) {
            trace("onError");
        }
       
        req.request();
        
        getPokemonWeight("voltorb");
    }

    static function getPokemonWeight(pokemonName: String) {
        var url = 'https://pokeapi.co/api/v2/pokemon/$pokemonName';
        var req = new haxe.Http(url);
        var weight = 0;

        req.onData = function(data) {
            var pokemon = haxe.Json.parse(data);
            var weight = pokemon.weight;
            trace("voltorb weight");
            trace(weight); 
        }

        req.onError = function(error) {
            trace("getPokemonWeight error");
        }

        req.request();

    }
}