<?php

/**
 * This is the model class for table "goles".
 *
 * The followings are the available columns in table 'goles':
 * @property integer $id
 * @property integer $idJugador
 * @property integer $idEquipo
 * @property integer $idJuego
 * @property string $tiempo
 *
 * The followings are the available model relations:
 * @property Jugadores $idJugador0
 * @property Equipos $idEquipo0
 * @property Juegos $idJuego0
 */
class Goles extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Goles the static model class
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
		return 'goles';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, idJugador, idEquipo, idJuego, tiempo', 'required'),
			array('id, idJugador, idEquipo, idJuego', 'numerical', 'integerOnly'=>true),
			array('tiempo', 'length', 'max'=>10),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, idJugador, idEquipo, idJuego, tiempo', 'safe', 'on'=>'search'),
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
			'jugador' => array(self::BELONGS_TO, 'Jugadores', 'idJugador'),
			'equipo' => array(self::BELONGS_TO, 'Equipos', 'idEquipo'),
			'juego' => array(self::BELONGS_TO, 'Juegos', 'idJuego'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'idJugador' => 'Id Jugador',
			'idEquipo' => 'Id Equipo',
			'idJuego' => 'Id Juego',
			'tiempo' => 'Tiempo',
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
		$criteria->compare('idJugador',$this->idJugador);
		$criteria->compare('idEquipo',$this->idEquipo);
		$criteria->compare('idJuego',$this->idJuego);
		$criteria->compare('tiempo',$this->tiempo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}