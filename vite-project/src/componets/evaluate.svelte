<script lang="ts">
  import { App } from "../lib/App";

  const app = new App();
 
  let userId: string = "";
  let noteValue: string = "";

  async function evaluate(e: Event) {
    e.preventDefault();
    if (userId !== "" && noteValue !== "") {
      const contract = await app.getContract();
      await contract.methods
        .evalute(userId, noteValue)
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
      noteValue = "";
    }
  }
</script>

<div class="border-2 my-4 py-4">
  <h2 class="py-2 text-2xl">Let's evaluate a Student</h2>
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
    <input
      bind:value={noteValue}
      class="border-2 rounded-md text-center"
      type="number"
      name=""
      id=""
      min="0"
      required
      placeholder="Note"
    />
  </div>
  <button
    on:click={evaluate}
    class="bg-green-400 mt-4 px-4 py-3 text-white rounded-md shadow-lg hover:bg-green-300"
    >Evaluate</button
  >
</div>
