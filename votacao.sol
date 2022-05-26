// SPDX-License-Identifier: GPL-2.0-or-Later
pragma solidity >=0.8.0;

contract Votacao{
    address public sindico;
    string public pauta;
    
    enum Opcao{Sim, Nao, Nulo , Abstencao}
    mapping(Opcao => address[]) voto;
    mapping(address => bool) moradores;

    constructor(string memory _pauta){
        pauta = _pauta;
        sindico = msg.sender;
    }

    function votar(Opcao _opcao)public {
        require(!moradores[msg.sender], "O morador ja votou !");
        voto[_opcao].push(msg.sender);
        moradores[msg.sender] = true;
    }

    function verResultado(Opcao _opcao) public view returns(uint){

      return voto[_opcao].length;

    }

}