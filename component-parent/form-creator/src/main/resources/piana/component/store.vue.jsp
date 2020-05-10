<app name="store"></app>

<html-template>
    <div></div>
</html-template>

<script>
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
