<app name="store"></app>

<html-template>
    <div></div>
</html-template>

<vue-script>
    <script for="component">
        const $app$ = {
            state: {
                formValue: {},
            },
            setFormValue(formValue) {
                this.formValue = formValue;
            },
            setToForm(key, value) {
                this.state.formValue[key] = value;
            },
            getFormValue() {
                return this.state.formValue;
            }
        };
    </script>
    <script for="state">
    </script>
</vue-script>