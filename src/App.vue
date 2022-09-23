<template>
  <div v-if="responses.length != 0">
    <ScoreBoard :computer-score="computerScore" :player-score="playerScore"/>
    <h1 v-html="question"></h1>
    <div class="answer">
      <div v-for="(resp, id) in responses" :key="id" :value="resp">
        <input
          type="radio"
          name="options"
          v-model="resultChecked"
          :value="resp"
          :disabled="result"
        />
        <label v-html="resp"></label>
      </div>
    </div>
    <br />
    <section name="result">
      <div v-if="canShowResult">
        <h4 v-if="!result">You have to choose first</h4>
        <h4
          v-else-if="resultOk"
          v-html="'✅ Congratulations, the answer ' + result + ' is correct.'"
        ></h4>
        <h4
          v-else
          v-html="
            'OOH, the answer ' +
            result +
            ' is incorrect. The right answer is ' +
            correctAnswer
          "
        ></h4>
      </div>
      <button class="send" type="button" @click="checkResult" v-if="!result">
        Send
      </button>
      <button class="send" type="button" @click="getNextQuestion" v-if="result">
        Next question
      </button>
    </section>
  </div>
</template>
<script>
import ScoreBoard from '/src/components/ScoreBoard.vue';
export default {
  name: "App",
  components: { ScoreBoard },

  data() {
    return {
      canShowResult: null,
      correctAnswer: null,
      question: null,
      responses: [],
      resultChecked: null,
      resultOk: null,
      result: null,
      computerScore: 0,
      playerScore: 0,
    };
  },

  created() {
    this.getData();
  },

  methods: {
    checkResult() {
      this.canShowResult = true;
      if (!this.resultChecked) return;
      this.result = this.resultChecked;
      this.resultOk = this.resultChecked === this.correctAnswer;
      if (this.resultOk) this.playerScore += 1;
      else this.computerScore += 1;
    },

    async getData() {
      await this.axios
        .get("https://opentdb.com/api.php?amount=1&category=18")
        .then((response) => {
          const resp = response.data.results[0];
          this.question = resp.question;
          const array = resp.incorrect_answers;
          const x = Math.round(Math.random() * array.length);
          array.splice(x, 0, resp.correct_answer);
          this.responses = array;
          this.correctAnswer = resp.correct_answer;
        });
    },

    async getNextQuestion() {
      await this.getData();
      this.canShowResult = null;
      this.result = null;
      this.resultChecked = null;
      this.resultOk = null;
    },
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 60px auto;
  max-width: 960px;

  .answer {
    display: flex;
    flex-direction: column;
    justify-content: start;
    text-align: left;
    margin-left: 10em;
  }

  button.send {
    margin-top: 12px;
    height: 40px;
    min-width: 120px;
    padding: 0 16px;
    color: #fff;
    background-color: #1867c0;
    border: 1px solid #1867c0;
    cursor: pointer;
  }

  input[type="radio"] {
    margin: 12px 4px;
  }
}
</style>
