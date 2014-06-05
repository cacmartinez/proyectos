<?php

/**
 * This is the model class for table "jugadores".
 *
 * The followings are the available columns in table 'jugadores':
 * @property integer $id
 * @property string $nombre
 * @property integer $idEquipo
 * @property integer $idFotoPortada
 * @property integer $numero
 * @property integer $pocision
 *
 * The followings are the available model relations:
 * @property Goles[] $goles
 * @property Equipos $idEquipo0
 * @property Fotos $idFotoPortada0
 */
class Jugadores extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Jugadores the static model class
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
		return 'jugadores';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, nombre, idEquipo, idFotoPortada, numero, pocision', 'required'),
			array('id, idEquipo, idFotoPortada, numero, pocision', 'numerical', 'integerOnly'=>true),
			array('nombre', 'length', 'max'=>50),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre, idEquipo, idFotoPortada, numero, pocision', 'safe', 'on'=>'search'),
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
			'goles' => array(self::HAS_MANY, 'Goles', 'idJugador'),
			'idEquipo0' => array(self::BELONGS_TO, 'Equipos', 'idEquipo'),
			'idFotoPortada0' => array(self::BELONGS_TO, 'Fotos', 'idFotoPortada'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre' => 'Nombre',
			'idEquipo' => 'Id Equipo',
			'idFotoPortada' => 'Id Foto Portada',
			'numero' => 'Numero',
			'pocision' => 'Pocision',
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
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('idEquipo',$this->idEquipo);
		$criteria->compare('idFotoPortada',$this->idFotoPortada);
		$criteria->compare('numero',$this->numero);
		$criteria->compare('pocision',$this->pocision);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}