// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

// No utilizar en producción de código real

contract Transferencia {

        mapping(address => string) private recogerDato;
        mapping(string => address) private validarDireccion;

        function EnviarDato(string memory _miDato, address _receptor) public {
            recogerDato[_receptor] = _miDato;
            recogerDato[msg.sender] = _miDato;
            validarDireccion[_miDato] = _receptor;
		}

        function VerDato(address _emisor) public view returns (string memory) {
            string memory dato = recogerDato[_emisor];
            address direccionVerificada = validarDireccion[dato];
            require(direccionVerificada == msg.sender);
            return dato;
        }
}
