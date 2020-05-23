<app name="controlText"></app>

<html-template>
    <div class="form-group">
        <label >{{label}}</label>
        <input type="text" ref="itsElement" id="regexp-mask" class="form-control" v-on:keyup="keymonitor">
        <span>{{itsValue}}</span>
    </div>
</html-template>

<script>
    var $app$ = Vue.component('$app$', {
        template: '$template$',
        props: {
            label: String,
            name: String,
            formName: String,
            maskModel: {
                type: Object,
                default: function () {
                    return {
                        mask: String,
                        min: String,
                        max: String,
                        pattern: String,
                        thousandsSeparator: String,
                        lazy: Boolean
                    }
                }
            }
        },
        watch: {
            val: function () {
                this.itsValue = store.state.formValue[this.formName][this.name]
                this.$refs.itsElement.value = store.state.formValue[this.formName][this.name]
            },
            itsValue: function () {
                // console.log(this.$data.itsValue);
            }
        },
        data: function () {
            return {
                storeState: store.state,
                itsValue: ''
            }
        },
        methods:{
            keymonitor: function () {
                this.itsValue = this.$refs.itsElement.value;
                obj = Object.assign({}, this.storeState.formValue[this.formName]);
                obj[this.name] = this.itsValue;
                this.storeState.formValue[this.formName] = obj;
            }
        },
        updated: function () {
        },
        computed: {
            val: function() {
                return store.state.formValue[this.formName][this.name];
            }
        },
        mounted: function () {
            // https://imask.js.org/
            this.$nextTick(function () {
                // console.log(this.maskModel.mask)
                console.log(this.name)
                console.log(!this.maskModel.mask)
                if (!this.maskModel || !this.maskModel.mask) {
                    // console.log("maskModel not exist");
                    return;
                } else {
                    // console.log("maskModel exist");
                    // console.log(this.maskModel.mask);
                }

                let regex = this.maskModel.mask;
                if(this.maskModel.mask != 'Date' && this.maskModel.mask != 'Number' && this.maskModel.mask != 'Text') {
                    let match = this.maskModel.mask.match(new RegExp('^/(.*?)/([gimy]*)$'));
                    regex = new RegExp(match[1], match[2]);
                }
                // console.log(moment('1998/12/13', 'YYYY/mm/dd'));
                // console.log(regex);
                // var flags = this.pattern.replace(/.*\/([gimy]*)$/, '$1');
                // var pattern = this.pattern.replace(new RegExp('^/(.*?)/'+flags+'$'), '$1');
                // var regex = new RegExp(pattern, flags);
                maskReg = {
                }
                if(regex === 'Date') {
                    maskReg = {
                        mask: Date,
                        pattern: 'Y/m/d',
                        lazy: false,
                        autofix: true,
                        overwrite: true,  // defaults to `false`
                        min: new Date(parseInt(this.maskModel.min.substring(0,4)), parseInt(this.maskModel.min.substring(5,7)), parseInt(this.maskModel.min.substring(8,10))),
                        max: new Date(parseInt(this.maskModel.max.substring(0,4)), parseInt(this.maskModel.max.substring(5,7)), parseInt(this.maskModel.max.substring(8,10))),
                        format: function (date) {
                            console.log(date)
                            var day = date.getDate();
                            var month = date.getMonth() + 1;
                            var year = date.getFullYear();

                            if (day < 10) day = "0" + day;
                            if (month < 10) month = "0" + month;
                            return [year, month, day].join('/');
                        },
                        parse: function (str) {
                            var yearMonthDay = str.split('/');
                            return new Date(yearMonthDay[0], yearMonthDay[1] - 1, yearMonthDay[2]);
                        },
                    }
                    // console.log(parseInt(this.maskModel.min.substring(0,4)));
                    // console.log(parseInt(this.maskModel.min.substring(5,7)));
                    // console.log(parseInt(this.maskModel.min.substring(8,10)));
                    // maskReg['overwrite'] = true;
                    // maskReg['autofix'] = true;
                    // blocks = {
                    //     DD: {mask: IMask.MaskedRange, from: 1, to: 31},
                    //     MM: {mask: IMask.MaskedRange, from: 1, to: 12},
                    //     YYYY: {mask: IMask.MaskedRange, from: parseInt(this.maskModel.min.substring(0,4)), to: parseInt(this.maskModel.max.substring(0,4))}
                    // }
                    // maskReg['blocks'] = blocks;
                    // if(this.maskModel.min)
                    //     maskReg['min'] = new Date(this.maskModel.min.substring(0,4),
                    //         this.maskModel.min.substring(5,7),
                    //         this.maskModel.min.substring(8,10));
                    // if(this.maskModel.max)
                    //     maskReg['max'] = new Date(this.maskModel.max.substring(0,4),
                    //         this.maskModel.max.substring(5,7),
                    //         this.maskModel.max.substring(8,10));
                } else if(regex === 'Number') {
                    maskReg = {
                        mask: Number,
                        min: parseInt(this.maskModel.min ? this.maskModel.min : "0"),
                        max: parseInt(this.maskModel.max ? this.maskModel.max : "100000")
                    }
                } else if(regex === "Text") {
                    maskReg = {
                        mask: this.maskModel.pattern
                    }
                } else {
                    maskReg['mask'] = regex;
                    if(this.maskModel.min)
                        maskReg['min'] = this.maskModel.min;
                    if(this.maskModel.max)
                        maskReg['max'] = this.maskModel.max;
                    if(this.maskModel.thousandsSeparator)
                        maskReg['thousandsSeparator'] = this.maskModel.thousandsSeparator;
                    maskReg['lazy'] = this.maskModel.lazy;
                }
                // console.log(maskReg)
                var regExpMask = IMask(
                    this.$refs.itsElement, maskReg
                );
            });
        }
    })
</script>


