<app name="controlText"></app>

<html-template>
    <div class="form-group">
        <label >{{label}}</label>
        <input type="text" class="form-control" >
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
            label: String,
            name: String
        },
        data: function () {
            return {
                message: 'Hello To Box'
            }
        }
    })
</script>


