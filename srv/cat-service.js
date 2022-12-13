const cds = require('@sap/cds')
module.exports = cds.service.impl(function () {

    const { POHeaders } = this.entities()

    this.before ('SAVE', 'POHeaders', async (req) => {
        const { partner, currency_code, grossAmount, tax } = req.data;
        if (partner == null) throw req.reject (400, 'Enter a partner.')
        if (currency_code == null) throw req.reject (400, 'Enter a currency.')
        if (grossAmount == null) throw req.reject (400, 'Enter a grossAmount.')
        if (tax == null) throw req.reject (400, 'Enter a tax.')   
        req.data.taxAmount = grossAmount * tax / 100; 
        req.data.netAmount = grossAmount  + req.data.taxAmount; 
    })


    this.after('each', POHeaders, row =>{
        console.log(`Read PO: ${row.ID}`)
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [POHeaders], async (po, req) => {
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting: poChanged ${header.ID}`)
            this.emit('poChange', header)
        })
    })
})