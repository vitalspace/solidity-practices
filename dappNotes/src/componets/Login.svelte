<script lang="ts">
  import { isLoggedIn, userWalletId } from "../stores/stores";
  const Login = async (e: Event) => {
    e.preventDefault();
    //@ts-ignore
    if (window.ethereum) {
      //@ts-ignore
      const account = await window.ethereum.request({
        method: "eth_requestAccounts",
      });
      userWalletId.update(e => e = account[0])
      isLoggedIn.update(e => e = true)
    }
  };
</script>


{#if !$isLoggedIn}
  <div>
    <button
      on:click={Login}
      class="bg-green-500 px-5 py-2 text-white hover:bg-green-400"
      >Login with Metamask</button
    >
  </div>
{/if}
