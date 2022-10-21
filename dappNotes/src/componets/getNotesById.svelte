<script lang="ts">
  import { App } from "../lib/App";

  const app = new App();

  let result: number;
  let viewResult: boolean = false;
  let noteUser: string;

  let userId: string = "";

  async function evaluate(e: Event) {
    e.preventDefault();
    if (userId !== "") {
      const contract = await app.getContract();
      viewResult = true;
      noteUser = userId;
      result = await contract.methods.getNotesById(userId).call();
      userId = "";
    }
  }
</script>

<div class="border-2 my-4 py-4">
  <h2 class="py-2 text-2xl">Get Note</h2>
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

  {#if viewResult}
    <div class="my-4">
      <h2 class="">{noteUser} note is {result}</h2>
    </div>
  {/if}

  <button
    on:click={evaluate}
    class="bg-green-400 mt-4 px-4 py-3 text-white rounded-md shadow-lg hover:bg-green-300"
    >Request</button
  >
</div>
