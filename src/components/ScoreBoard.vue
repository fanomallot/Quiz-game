<template>
  <div class="score">
   <p>Player <span> {{ playerScore }} </span> x <span> {{ computerScore }} </span> Computer</p>
   <hr>
  </div>
</template>

<script>
export default {
  name: 'ScoreBoard',
  props: {
    playerScore: Number,
    computerScore: Number
  }
}
</script>
<style lang="scss">
.score span {
    padding: 8px;
    font-weight: bold;
    border: 1px solid black;
  }
</style>
