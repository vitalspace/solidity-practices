<script lang="ts">
    import { App } from "../lib/App";
  
    const app = new App();

    ( async () => {
      const contract = await app.getContract();
    console.log(contract.methods)
  })()
  
    let userId: string = "";
  
    async function evaluate(e: Event) {
      e.preventDefault();
      if (userId !== "") {
        const contract = await app.getContract();
        await contract.methods
          .requestRevition(userId)
          .send({ from: await app.loadAccount(), gas: 0 })
          .on("transactionHash", function (hash) {
            console.log("Approving", hash);
            // document.getElementById("web3_message").textContent = "Approving...";
          })
          .on("receipt", function (receipt) {
            console.log("Success", receipt);
            // document.getElementById("web3_message").textContent = "Success!";
          })
          .catch((revertReason) => {
            console.log(revertReason);
            // console.log("ERROR! Transaction reverted: " + revertReason.receipt.transactionHash)
          });
        userId = "";
      }
    }
  </script>
  
  <div class="border-2 my-4 py-4">
    <h2 class="py-2 text-2xl">Request Revision</h2>
    <div class="py-4">
      <input
        bind:value={userId}
        class="border-2 rounded-md text-center"
        type="text"
        name=""
        id=""
        required
        placeholder="Id"
      />
    </div>
    <button
      on:click={evaluate}
      class="bg-green-400 mt-4 px-4 py-3 text-white rounded-md shadow-lg hover:bg-green-300"
      >Request</button
    >
  </div>
  