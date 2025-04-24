import 'package:band_names_app/models/band_model.dart';
import 'package:band_names_app/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BandModel>data = [];
  
  @override
  Widget build(BuildContext context) {
    data = context.select((CounterBloc counterBloc) => counterBloc.state.bands);

    return Scaffold(
      appBar: AppBar(title: const Text('App names'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            _ContentBandsInfo(data: data),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) { 
                  final band = data[index];
                  return _ListTileOption(band: band, onTap: () {
                    context.read<CounterBloc>().add(UpdateBandsListVotes(band));
                  },);
                 },
                
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _addBandDialog(context), child: Icon(Icons.add),),
    );
  }

  _addBandDialog(BuildContext context) {
    final textEditControl = TextEditingController();

    showDialog(
      builder: (context) => AlertDialog(
        title: Text('Add band'),
        content: TextField(
          controller: textEditControl,
        ),
        actions: [
          MaterialButton(onPressed: () {
            _addBand(textEditControl.text);
            Navigator.pop(context);

          }, child: Text('Ok')),
          MaterialButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Cancel'),)
        ],
        
      ), context: context,
    );
  }

  _addBand(String name) {
    if (name.isEmpty || name.trim() == '') {
      return;
    }
    context.read<CounterBloc>().add(AddBand(BandModel(id:  data.length + 1, name: name, votes: 0, color: Colors.black)));
  }
}

class _ContentBandsInfo extends StatelessWidget {
  final List<BandModel> data;

  const _ContentBandsInfo({
    required this.data,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 200,
          height: 200,
          child: _BandInfoGrafic(data),
        ),
        SizedBox(width: 10,),
        _ListBandInfo(data: data)
      ],
    );
  }
}

class _BandInfoGrafic extends StatelessWidget {
  final List<BandModel>bands;

  const _BandInfoGrafic(this.bands);


  @override
  Widget build(BuildContext context) {
    int totalVotes = 0;
    for (var band in bands) {
      totalVotes = band.votes + totalVotes;
    }

    return Stack(
      fit: StackFit.expand,
      children: bands.map((band) => CircularProgressIndicator(value: (band.votes / totalVotes), strokeWidth: 10, color: band.color,)).toList(),
    );
  }
}

class _ListBandInfo extends StatelessWidget {
  const _ListBandInfo({
    required this.data,
  });

  final List<BandModel> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: data.map((band) => Row(
        children: [
          Container(
            width: 10,
            height: 10,
            color: band.color,
          ),
          SizedBox(width: 5,),
          Text(band.name)
        ],
      ),).toList(),
      )
    );
  }
}

class _ListTileOption extends StatelessWidget {
  final BandModel band;
  final GestureTapCallback onTap;

  const _ListTileOption({
    required this.band, required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${band.id}'),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print(direction);
        print('id -> ${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.6),
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: Text('Delet band', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      child: ListTile(
        leading: CircleAvatar(child: Text(band.name.substring(0,2)),),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),),
        onTap: onTap,
      ),
    );
  }
}


