const User=require('../models/user');

module.exports=function(app){
    app.get('/Matches',(req,res)=>{
        User.getMatche((err,data)=>{
            res.status(200).json(data)
        })
    });
    
app.post('/Matches',(req,res)=>{
    const GroupMatche={
        idMatche:null,
        Winner:req.body.Winner,
        Looser:req.body.Looser,
        locate:req.body.locate,
        date:req.body.date,
        Championship_idChampionship:req.body.Championship_idChampionship,
        Groups_idGroups:req.body.Groups_idGroups,
        Resultados_idResultados:req.body.Resultados_idResultados

    };
    User.insertMatche(GroupMatche,(err,data)=>{
        if(data && data.insertId ){
            res.json({
                success:true,
                msg:'dato insertado',
                data:data
            })
        }else{
            res.status(500).json({
                success:false,
                msg:'Error'
            })
        }
    })
});
}
// {
//     "Observations":"prueba",
//      "Winner":true,
//      "Looser":false,
//      "locate":"estadio",
//      "date":"29/05/2019",
//      "Championship_idChampionship":1,
//      "Groups_idGroups":1
// }