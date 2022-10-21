import Web3 from "web3";
import { isLoggedIn, userWalletId } from "../stores/stores";

class App {
  //@ts-ignore
  web3:unknown = new Web3(web3.currentProvider);
  netWorkId: number = 5777;
  contract_path: string = "/contract.json";
  contract_address: string = "0x93767f0CE362ba7bb7AC5a2451EDbf7aaD32d465";

  constructor() {}

  init() {
    this.loadWeb3();
  }

  async loadWeb3() {
    //@ts-ignorets-ignore
    if (window.ethereum) {
      //@ts-ignorets-ignore
      this.web3 = new Web3(web3.currentProvider);
      await this.checkIfisLoggedIn();
    //   await this.checkNetWork();
    //   await this.checkIfPloyerIsProfessor();
      return;
    }
    alert("Please install Metamask");
  }

  async loadAccount() {
    //@ts-ignorets-ignore
    const accounts = await window.ethereum.request({
      method: "eth_requestAccounts",
    });
    return accounts[0];
  }

  async checkIfisLoggedIn() {
    //@ts-ignorets-ignore
    const isloggedin = await window.ethereum.request({
      method: "eth_accounts",
    });

    if (isloggedin.length > 0) {

      isLoggedIn.update((e) => (e = true));
      userWalletId.update(e => e = isloggedin[0] )
    }
  }

  async checkNetWork() {
    //@ts-ignorets-ignore
    const netWorkId = await this.web3.eth.net.getId();
    if (netWorkId != this.netWorkId) alert("Please set Ganache Network");
  }

  async getUserId() {
    //@ts-ignorets-ignore
    const userId = await window.ethereum.request({
      method: "eth_accounts",
    });
    return userId[0];
  }

  async getContract() {
    const request = await fetch(this.contract_path);
    const data = await request.json();
    //@ts-ignore
    const contract = new this.web3.eth.Contract(data, this.contract_address);
    // const contract = this.web3
    return contract;
  }

  async getProfessor() {
    const contract = await this.getContract();
    const deployer = await contract.methods.professor().call();
    return deployer;
  }

//   async checkIfPloyerIsProfessor() {
//     const uid = await this.getUserId();
//     const professor = await this.getProfessor();
//     if (toString(userId) === toString(professor)) {
//       userId = uid;
//       canEvalute = true;
//     }
//   }
}

export { App };
