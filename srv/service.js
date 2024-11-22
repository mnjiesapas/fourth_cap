const cds = require("@sap/cds");
const { Pmh3OdLlarsnacionalitat } = cds.entities("mnj.sbd");

module.exports = (srv) => {


    // http://odata.sabadell.cat/odata4Productor/odata4Productor.svc/Pmh3OdLlarsnacionalitat/?$format=json
    // Añadir un registro en los datos
    srv.on("CREATE", "Pmh3OdLlarsnacionalitat", async (req) => {
        await cds
            .transaction(req)
            .run(
                INSERT.into(Pmh3OdLlarsnacionalitat).entries({
                    NomesNacionals: req.data.NomesNacionals,
                    Districte: req.data.Districte,
                    NomesEstrangers: req.data.NomesEstrangers,
                    Sector: req.data.Sector,
                    Mixtes: req.data.Mixtes,
                    DataOficial: req.data.DataOficial
                })
            )
            .then((resolve, reject) => {
                if (resolve !== undefined) {
                    return req.data
                } else {
                    req.error(409, "Record Not Inserted");
                }
            }).catch((err) => {
                req.error(err.code, err.message);
            });
    });

    // Informar el campo clave Ordre para que se informe:
    srv.after("READ", "Pmh3OdLlarsnacionalitat", async (data) => {
        data.map((llarsnacionalitat, idx) => {
            llarsnacionalitat.Ordre = 20 + idx;
        });
    });

    // Filtrar datos por CONCORDIA
    srv.on("READ", "LlarsnacionalitatFilt", async (req) => {
        if(req.query.SELECT.where !== undefined){
            return await SELECT
            .from(Pmh3OdLlarsnacionalitat)
            .where `${req.query.SELECT.where}`;
            //.where `${req.query.SELECT.where[0].ref[0]} ${req.query.SELECT.where[1]} '${req.query.SELECT.where[2].val}'`;
            //.where  `Sector = ${req.query.SELECT.where[2].val}`;
            //.where `Sector = 'CONCÒRDIA'`;
        };
    });

    // http://odata.sabadell.cat/odata4Productor/odata4Productor.svc/Pmh3OdLlarsnombrepersones/?$format=json
    srv.after("READ", "Pmh3OdLlarsnombrepersones", async (data) => {
        data.map((nombrepersones, idx) => {
            nombrepersones.Ordre = 20 + idx;
        });
    });

    // http://odata.sabadell.cat/odata4Productor/odata4Productor.svc/Pmh3OdDadesdemografiques/?$format=json
    srv.after("READ", "Pmh3OdDadesdemografiques", async (data) => {
        data.map((dadesdemografiques, idx) => {
            dadesdemografiques.Ordre = 20 + idx;
        });
    });

    // http://odata.sabadell.cat/odata4Productor/odata4Productor.svc/Voluntariat/?$format=json
    srv.after("READ", "Voluntariat", async (data) => {
        data.map((voluntari, idx) => {
            voluntari.Voluntari_Ordre = idx;
        });
    });

};