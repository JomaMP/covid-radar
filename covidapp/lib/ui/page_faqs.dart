import 'package:flutter/material.dart';

class PageFaqs extends StatefulWidget {
  @override
  _PageFaqsState createState() => _PageFaqsState();
}

class _PageFaqsState extends State<PageFaqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CovidApp"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    '¿Quiénes forman los grupos de riesgo?',
    <Entry>[
      Entry('''•Personas de 60 años o más.
•Mujeres embarazadas.
•Niñas y niños menores de 5 años.
•Quienes padecen enfermedades inmunodepresivas, crónicas, cardiacas, pulmonares, renales, hepáticas, sanguíneas o metabólicas.
•Quienes padecen obesidad y sobrepeso.
•Si tienes dudas acerca de tu situación de salud, consulta a tu médico.'''),
    ],
  ),
  Entry(
    '¿Se contagia por el sudor?',
    <Entry>[
      Entry(
          '''El coronavirus no se transmite por el sudor ni por la sangre. Se propaga mediante gotículas procedentes de la nariz o la boca que salen despedidas cuando una persona infectada tose o exhala.'''),
    ],
  ),
  Entry(
    '¿Debo usar cubrebocas?',
    <Entry>[
      Entry(
          '''El cubreboca es una barrera útil para evitar que se expulsen las gotas de saliva que potencialmente estén contaminadas. El cubreboca se debe usar correctamente, sobre todo en lugares públicos cerrados en los que no se pueda mantener la sana distancia. No te olvides de usar el cubreboca junto con las medidas básicas de prevención como son la sana distancia (dos metros), lavado frecuente de manos y estornudo de etiqueta.'''),
    ],
  ),
  Entry(
    '¿Debo desinfectar toda mi casa, escuela o lugar de trabajo?',
    <Entry>[
      Entry(
          '''Hay que mantener las medidas de higiene, limpiando con agua y con jabón, pero no hay necesidad de desinfectar los espacios de manera especial.'''),
    ],
  ),
  Entry(
    '¿Puedo contagiarme de una persona sin síntomas?',
    <Entry>[
      Entry(
          '''El virus se contagia con mayor facilidad cuando una persona infectada presenta síntomas, pero también es posible contagiar el virus antes de que haya síntomas. Por eso, lo mejor es tener las manos limpias y no tocarse el rostro.'''),
    ],
  ),
  Entry(
    '¿Mis mascotas pueden contagiarse?',
    <Entry>[
      Entry(
          '''No hay evidencia científica de que el COVID-19 pueda infectar a los animales de compañía, en especial perros y gatos, y tampoco que puedan contagiar a humanos. Sin embargo, en caso de recuperación en casa es buena idea aplicar las medidas de sana distancia también con ellos.'''),
    ],
  ),
  Entry(
    '¿Debo aislarme si tuve contacto con un caso confirmado?',
    <Entry>[
      Entry(
          '''El aislamiento es una medida voluntaria: a nadie se le puede obligar, ni siquiera a los casos confirmados. Por fortuna, todos han aceptado la cuarentena para no diseminar la enfermedad.

Hay muchos casos de personas que decidieron ponerse en cuarentena al comprobar que estuvieron cerca de alguien que se enfermó de COVID-19.'''),
    ],
  ),
  Entry(
    '¿Qué es la transmisión comunitaria?',
    <Entry>[
      Entry(
          '''Esta etapa se da cuando se detectan contagios del virus entre personas dentro del país y que no hayan tenido necesariamente contacto con pacientes expuestos fuera de México. En este periodo de contagio local suele aumentar rápidamente el número de casos registrados y se toman medidas como suspensión de clases, implementación del trabajo a distancia o home office y cancelación de eventos masivos.

Fuente: Conferencia López-Gatell'''),
    ],
  ),
  Entry(
    '¿Qué debo hacer si se produce un brote en mi comunidad?',
    <Entry>[
      Entry(
          '''Mantén la calma y quédate en casa. Conserva la sana distancia y limita el contacto cercano con otras personas tanto como sea posible, aproximadamente 2 metros.

Continúa practicando las medidas básicas de prevención. Si perteneces a alguno de los grupos de riesgo para complicar y morir por COVID-19, pide a familiares, amigos y profesionales de la salud que te vigilen durante el brote. También mantente en contacto con familiares y amigos con mayor riesgo de desarrollar enfermedades graves, como las personas adultas mayores, personas embarazadas, personas con discapacidad y las personas con enfermedades crónicas.

Fuente: Centros para el Control y la Prevención de Enfermedades (CDC -EU)'''),
    ],
  ),
  Entry(
    '¿Qué debo hacer si algún miembro de mi familia contrae COVID-19?',
    <Entry>[
      Entry(
          '''Los síntomas de COVID-19 (al menos dos de los siguientes: tos, dolor de de cabeza y fiebre, y acompañado de al menos uno de los que siguen: dolor o ardor de garganta, dolores musculares o de las articulaciones, ojos rojos y para los casos graves dificultad para respirar o dolor en el pecho) se parecen mucho a los de otras enfermedades causadas por otros virus. Si un miembro de su familia tiene dificultades para respirar, diríjanse a un servicio de urgencias médicas o llamen al 911 de inmediato.

Si presenta un cuadro leve, llame al 800 0044 800 o al 55 5658 1111 para que los oriente si el paciente debe ser tratado en casa, ir a consulta médica.

Fuente: Centros para el Control y la Prevención de Enfermedades (CDC -EU)'''),
    ],
  ),
  Entry(
    '¿Es posible contagiarse de COVID-19 por contacto con una persona que no presente ningún síntoma?',
    <Entry>[
      Entry(
          '''La principal forma de propagación de la enfermedad es a través de las gotas respiratorias expelidas por alguien al toser. El riesgo de contraer la COVID-19 de alguien que no presente ningún síntoma es muy bajo. Sin embargo, muchas personas que lo contraen solo presentan síntomas leves. Esto es particularmente cierto en las primeras etapas de la enfermedad. Por lo tanto, es posible contagiarse de alguien que, por ejemplo, solamente tenga una tos leve y no se sienta enferma, por lo tanto lo más importante es seguir las medidas básicas de prevención.

Fuente: Instituto Nacional de Ciencias Médicas y Nutrición Salvador Zubirán'''),
    ],
  ),
  Entry(
    '¿Corren los fumadores y los consumidores de tabaco mayor riesgo de contraer la COVID-19?',
    <Entry>[
      Entry(
          '''Los fumadores son más vulnerables a COVID-19, ya que el acto de fumar supone acercar los dedos (y los cigarrillos, que pueden estar contaminados) a los labios, lo que aumenta la posibilidad de transmisión del virus de la mano a la boca. Los fumadores también pueden padecer una enfermedad pulmonar crónica o tener una capacidad pulmonar disminuida, lo que potencia enormemente el riesgo de enfermedad grave.

Fuente: Organización Mundial de la Salud (OMS)'''),
    ],
  ),
  Entry(
    '¿Puede alguien que ha estado en cuarentena por el COVID-19 propagar la enfermedad a los demás?',
    <Entry>[
      Entry(
          '''En el caso del COVID-19, el periodo de cuarentena es de 14 días desde la última fecha de exposición, ya que 14 días es el periodo más largo de incubación que se ha observado en coronavirus similares. Se considera que la persona a quien se permitió salir de la cuarentena por el COVID-19 no representa un riesgo de propagación del virus a los demás porque durante dicho periodo no presentó la enfermedad, o que ya pasaron los 14 días después del inicio de síntomas (casos leves) y después de terminar sus síntomas (casos graves).

Fuente: Centros para el Control y la Prevención de Enfermedades (CDC -EU)'''),
    ],
  ),
  Entry(
    '¿Las mujeres embarazadas son más propensas a infectarse con COVID-19? ¿Será peligroso para el feto?',
    <Entry>[
      Entry(
          '''Aún no hay estudios científicos publicados con información sobre la susceptibilidad de las embarazadas a infectarse. Estas personas sufren cambios en el sistema inmune y en su estado fisiológico, lo que puede aumentar sus posibilidades de sufrir infecciones virales de las vías respiratorias, incluyendo la COVID-19.

Aunque aún se desconoce si una persona embarazada enferma de COVID-19 puede transmitir el virus al feto o al neonato por otras vías de transmisión vertical (antes, durante o después del parto), se clasifican a las personas embarazadas como en mayor riesgo de complicación y muerte por COVID-19 por la experiencia con influenza.

Fuente: Naciones Unidas'''),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      backgroundColor: Colors.blue[50],
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      // textColor: Colors.black,
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
