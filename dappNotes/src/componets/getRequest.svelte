<script lang="ts">
    import { App } from "../lib/App";
  
    const app = new App();
  
    let result: number;
    let viewResult: boolean = false;
    let noteUser: string;
  
    let userId: string = "";
  
    async function evaluate(e: Event) {
      e.preventDefault();
        const contract = await app.getContract();
        viewResult = true;
        result = await contract.methods.getRequest().call();
    }
  </script>
  
  <div class="border-2 my-4 py-4">
    <h2 class="py-2 text-2xl">Get Requests</h2>
  
    {#if viewResult}
      <div class="my-4">
        <h2 class="">{result}</h2>
      </div>
    {/if}
  
    <button
      on:click={evaluate}
      class="bg-green-400 mt-4 px-4 py-3 text-white rounded-md shadow-lg hover:bg-green-300"
      >Request</button
    >
  </div>
  