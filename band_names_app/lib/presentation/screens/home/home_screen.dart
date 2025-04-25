import 'package:band_names_app/models/band_model.dart';
import 'package:band_names_app/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BandModel>bands = [];

  @override
  void initState() {
    super.initState();

    final socketService = Provider.of<SocketProvider>(context, listen: false);

    socketService.soket.on('getBands', (data) {
      bands = (data as List).map((band) => BandModel.fromJson(band)).toList();
      setState(() {});
    },);

  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketProvider>(context, listen: false);
    socketService.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketProvider>(context);
    final iconStatus = socketService.serverStatus == ServerStatus.online ? Icon(Icons.check_circle, color: Colors.blue[300], size: 25,) : Icon(Icons.sick, color: Colors.red[300], size: 25,);

    return Scaffold(
      appBar: AppBar(title: const Text('App names'), centerTitle: true, actions: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: iconStatus,
        )
      ]),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // _ContentBandsInfo(data: data),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: bands.length,
                itemBuilder: (BuildContext context, int index) { 
                  final band = bands[index];
                  return _ListTileOption(band: band);
                 },
                
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _addBandDialog(context), child: const Icon(Icons.add),),
    );
  }

  _addBandDialog(BuildContext context) {
    final textEditControl = TextEditingController();

    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Add band'),
        content: TextField(
          controller: textEditControl,
        ),
        actions: [
          MaterialButton(onPressed: () {
            _addBand(textEditControl.text);
            Navigator.pop(context);

          }, child: const Text('Ok')),
          MaterialButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Cancel'),)
        ],
        
      ), context: context,
    );
  }

  _addBand(String name) {
    if (name.isEmpty || name.trim() == '') {
      return;
    }
    // context.read<CounterBloc>().add(AddBand(BandModel(id:  data.length + 1, name: name, votes: 0, color: Colors.black)));
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
          padding: const EdgeInsets.all(20),
          width: 200,
          height: 200,
          child: _BandInfoGrafic(data),
        ),
        const SizedBox(width: 10,),
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
      children: bands.map((band) => CircularProgressIndicator(value: (band.votes / totalVotes), strokeWidth: 10, )).toList(),
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
            color: Colors.red,
          ),
          const SizedBox(width: 5,),
          Text(band.name)
        ],
      ),).toList(),
      )
    );
  }
}

class _ListTileOption extends StatelessWidget {
  final BandModel band;

  const _ListTileOption({
    required this.band,
  });



  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketProvider>(context);

    return Dismissible(
      key: Key('${band.id}'),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print(direction);
        print('id -> ${band.id}');
      },
      background: Container(
        padding: const EdgeInsets.only(left: 8.6),
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Text('Delet band', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      child: ListTile(
        leading: CircleAvatar(child: Text(band.name.substring(0, 2))),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          socketService.soket.emit('vote-band' , {'id': band.id});
          // context.read<CounterBloc>().add(UpdateBandsListVotes(band));
        },
      ),
    );
  }
}


