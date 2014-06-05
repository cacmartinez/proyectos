<?php

/**
 * This is the model class for table "juegos".
 *
 * The followings are the available columns in table 'juegos':
 * @property integer $id
 * @property string $mbp
 * @property integer $idEquipoCasa
 * @property integer $idEquipoVisitante
 * @property integer $idFotoPortada
 * @property integer $tiempo
 * @property string $fecha
 *
 * The followings are the available model relations:
 * @property Goles[] $goles
 * @property Equipos $idEquipoCasa0
 * @property Equipos $idEquipoVisitante0
 * @property Fotos $idFotoPortada0
 */
class Juegos extends CActiveRecord
{    
	
	public $golesCasa = 0;
	public $golesVisitantes = 0;
	
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Juegos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'juegos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, mbp, idEquipoCasa, idEquipoVisitante, idFotoPortada, tiempo, fecha, torneo_id', 'required'),
			array('id, idEquipoCasa, idEquipoVisitante, idFotoPortada, tiempo, torneo_id', 'numerical', 'integerOnly'=>true),
			array('mbp', 'length', 'max'=>50),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, mbp, idEquipoCasa, idEquipoVisitante, idFotoPortada, tiempo, fecha, torneo_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'goles' => array(self::HAS_MANY, 'Goles', 'idJuego'),
			'casa' => array(self::BELONGS_TO, 'Equipos', 'idEquipoCasa'),
			'visitante' => array(self::BELONGS_TO, 'Equipos', 'idEquipoVisitante'),
			'fotoPortada' => array(self::BELONGS_TO, 'Fotos', 'idFotoPortada'),
			'fotoEquipo' => array(self::BELONGS_TO, 'Fotos', 'idFotoPortada'),
			'torneo' => array(self::BELONGS_TO, 'Torneos', 'torneo_id'),
			//'golesVisitanteCount' => array(self::STAT, 'Goles', 'idJuego','condition'=>'idEquipo=13'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'mbp' => 'Mbp',
			'idEquipoCasa' => 'Id Equipo Casa',
			'idEquipoVisitante' => 'Id Equipo Visitante',
			'idFotoPortada' => 'Id Foto Portada',
			'tiempo' => 'Tiempo',
			'fecha' => 'Fecha',
			'torneo_id' => 'Id Torneo',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('mbp',$this->mbp,true);
		$criteria->compare('idEquipoCasa',$this->idEquipoCasa);
		$criteria->compare('idEquipoVisitante',$this->idEquipoVisitante);
		$criteria->compare('idFotoPortada',$this->idFotoPortada);
		$criteria->compare('torneo_id',$this->torneo);
		$criteria->compare('tiempo',$this->tiempo);
		$criteria->compare('fecha',$this->fecha,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}