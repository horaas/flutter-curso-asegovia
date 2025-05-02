import 'package:band_names_app/models/band_model.dart';
import 'package:band_names_app/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
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

    socketService.soket.on('getBands', _handleActiveBand);
  }

  _handleActiveBand(dynamic payload) {
    bands = (payload as List).map((band) => BandModel.fromJson(band)).toList();
    setState(() {});
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
            _ContentBandsInfo(bands: bands),
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
    final socketService = Provider.of<SocketProvider>(context, listen: false);
    socketService.soket.emit('add-band',{'name': name} );
  }
}

class _ContentBandsInfo extends StatelessWidget {
  final List<BandModel> bands;

  const _ContentBandsInfo({
    required this.bands,
  });


  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};

    for (var element in bands) {
      dataMap.putIfAbsent(element.name, () => element.votes.toDouble(),);
    }

    return dataMap.isEmpty ?  Container() : SizedBox(
      width: double.infinity,
      height: 200,
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false
      ),
        
      ),
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
    final socketService = Provider.of<SocketProvider>(context, listen: false);

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => socketService.soket.emit('delete-band',{'id': band.id} ),
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
        onTap: () => socketService.soket.emit('vote-band' , {'id': band.id}),
      ),
    );
  }
}


