const User=require('../models/user');
module.exports=function(app){
    app.get('/users',(req,res)=>{
        User.getUsers((err,data)=>{
            res.status(200).json(data)
        })
    });
    
  


app.post('/chapionship',(req,res)=>{
    const chapionshipData={
        idChampionship:null,
        Name_Championship:req.body.Name_Championship,
        City_Championship:req.body.City_Championship
       
    };
    User.insertchampionship(chapionshipData,(err,data)=>{
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

// app.post('/Groups',(req,res)=>{
//     const idGroups={
//         idChampionship:null,
//         Name_Groups:req.body.Name_Championship,
//         Championship_idChampionship:req.body.City_Championship
       
//     };
//     User.insertGroups(GroupshipData,(err,data)=>{
//         if(data && data.insertId ){
//             res.json({
//                 success:true,
//                 msg:'dato insertado',
//                 data:data
//             })
//         }else{
//             res.status(500).json({
//                 success:false,
//                 msg:'Error'
//             })
//         }
//     })
// });
}