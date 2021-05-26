@Promo Hardfork live coding de ce matin: https://github.com/AbsoluteVirtueXI/CoinCoin-Token
Implementer le reste du Token pour qu'il soit considérer comme un véritable ERC20.
EIP20: https://eips.ethereum.org/EIPS/eip-20
Implémentation par OZ: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
(OZ implemente les ERC20 de manière assez générique donc complexe, faites plus simple)
Ecrivez les tests pour ce Token, il y a dejà des pistes à suivre dans le repo.
Pas la peine de tester l'event de Transfer au déploiement celui ou j'ai bloqué ce matin il est assez subtil car il faut verifier ce que la librairie waffle offre comme fonctionnalités non documentées
La logique de toutes ces fonctionnalités (transferFrom, approve etc) sont dans l'exemple du cours SmartWallet.sol ou dans les corrections des exos par vos camarades
https://ethereum-waffle.readthedocs.io/en/latest/matchers.html# pour la syntaxe sur les tests de revert et d'emit d'event