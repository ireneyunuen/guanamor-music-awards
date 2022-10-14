    // "SPDX-License-Identifier: MIT"
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract GMA {
    // VARIABLES
    uint256 totalVotos;

    //VOTANTES
    struct Votante{
        string NombredelVotante;
        bool voto;
        bool puedeVotar;
    }

    mapping (address => Votante) vota;

    //NOMINADOS
    struct ArtistasNominados {
        uint id;
        string NombreArtista;
        string Genero;
        uint256 votos;
    }

    //TIEMPO-VOTACION
    struct votingTime {
        uint startTime;
        uint endTime;
    }

    bool enableVote = false;

    votingTime public voteTime;

    // address public Owner;

    ArtistasNominados public Fanko = ArtistasNominados({
        id: 1,
        NombreArtista: "Fanko",
        Genero: "Funk",
        votos: 0
    });

     ArtistasNominados public LaVidaMia = ArtistasNominados({
        id: 2,
        NombreArtista: "La Vida Mia",
        Genero: "Rock Pop",
        votos: 0
    });

    ArtistasNominados public JotDog = ArtistasNominados({
        id: 3,
        NombreArtista: "Jot Dog",
        Genero: "Pop",
        votos: 0
    });

      ArtistasNominados public TheMilkBand = ArtistasNominados({
        id: 4,
        NombreArtista: "The Milk Band",
        Genero: "Rock",
        votos: 0
    });

      ArtistasNominados public Seggi = ArtistasNominados({
        id: 5,
        NombreArtista: "Seggi",
        Genero: "Pop",
        votos: 0
    });


     // darle permiso a alguien de votar - (Solo  Guanamor puede ejecutar)
    function permisoVotar(address _votante) public returns(bool, address) {
        vota[_votante].puedeVotar = true;
        return (true, _votante);
    }

    // votar 

    

    // votar tiempo
    function StartVoting() public {
        voteTime.startTime = block.timestamp;
    }

    function EndVoting(uint) public {
        voteTime.endTime = block.timestamp;
        enableVote = false;
    }

       function votar(uint _artista) public {
        require(vota[msg.sender].puedeVotar, "Los datos no coinciden o ya has votado");
        vota[msg.sender].voto = true;

         if(_artista == 1){
            // votas por Fanko
            Fanko.votos += 1;
        } else if (_artista == 2) {
            // votas por LaVidaMia
            LaVidaMia.votos += 1;
        }
        else if (_artista == 3) {
            // votas por JotDog
            JotDog.votos += 1;
        }
        else if (_artista == 4) {
            // votas por Yhe Milk Band
            TheMilkBand.votos += 1;
        }
        else{
            // votas por Seggi
            Seggi.votos += 1;
        }
}
}
