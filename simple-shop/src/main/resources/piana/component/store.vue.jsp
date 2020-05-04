<app name="store"></app>

<html-template>
    <div></div>
</html-template>

<script>
    const $app$ = {
        state: {
            loggedIn: false,
            numbers: [1, 2, 3],
            authorization: null
        },
        addNumber(newNumber) {
            this.state.numbers.push(newNumber);
        },
        setLoggedIn(n) {
            this.state.loggedIn = n;
        },
        getLoggedIn() {
            return this.state.loggedIn;
        },
        setAuthorization(authorization) {
            this.state.authorization = authorization;
        },
        getAuthorization() {
            return this.state.authorization;
        }
    };
</script>
