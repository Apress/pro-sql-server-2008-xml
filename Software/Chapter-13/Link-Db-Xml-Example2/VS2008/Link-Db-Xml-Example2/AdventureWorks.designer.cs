﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.1433
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Apress.Samples
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="AdventureWorks")]
	public partial class AdventureWorksDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertJobCandidate(JobCandidate instance);
    partial void UpdateJobCandidate(JobCandidate instance);
    partial void DeleteJobCandidate(JobCandidate instance);
    #endregion
		
		public AdventureWorksDataContext() : 
				base(global::Link_Db_Xml_Example2.Properties.Settings.Default.AdventureWorksConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public AdventureWorksDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AdventureWorksDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AdventureWorksDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public AdventureWorksDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<JobCandidate> JobCandidates
		{
			get
			{
				return this.GetTable<JobCandidate>();
			}
		}
	}
	
	[Table(Name="HumanResources.JobCandidate")]
	public partial class JobCandidate : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _JobCandidateID;
		
		private System.Nullable<int> _EmployeeID;
		
		private System.Xml.Linq.XElement _Resume;
		
		private System.DateTime _ModifiedDate;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnJobCandidateIDChanging(int value);
    partial void OnJobCandidateIDChanged();
    partial void OnEmployeeIDChanging(System.Nullable<int> value);
    partial void OnEmployeeIDChanged();
    partial void OnResumeChanging(System.Xml.Linq.XElement value);
    partial void OnResumeChanged();
    partial void OnModifiedDateChanging(System.DateTime value);
    partial void OnModifiedDateChanged();
    #endregion
		
		public JobCandidate()
		{
			OnCreated();
		}
		
		[Column(Storage="_JobCandidateID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int JobCandidateID
		{
			get
			{
				return this._JobCandidateID;
			}
			set
			{
				if ((this._JobCandidateID != value))
				{
					this.OnJobCandidateIDChanging(value);
					this.SendPropertyChanging();
					this._JobCandidateID = value;
					this.SendPropertyChanged("JobCandidateID");
					this.OnJobCandidateIDChanged();
				}
			}
		}
		
		[Column(Storage="_EmployeeID", DbType="Int")]
		public System.Nullable<int> EmployeeID
		{
			get
			{
				return this._EmployeeID;
			}
			set
			{
				if ((this._EmployeeID != value))
				{
					this.OnEmployeeIDChanging(value);
					this.SendPropertyChanging();
					this._EmployeeID = value;
					this.SendPropertyChanged("EmployeeID");
					this.OnEmployeeIDChanged();
				}
			}
		}
		
		[Column(Storage="_Resume", DbType="Xml", UpdateCheck=UpdateCheck.Never)]
		public System.Xml.Linq.XElement Resume
		{
			get
			{
				return this._Resume;
			}
			set
			{
				if ((this._Resume != value))
				{
					this.OnResumeChanging(value);
					this.SendPropertyChanging();
					this._Resume = value;
					this.SendPropertyChanged("Resume");
					this.OnResumeChanged();
				}
			}
		}
		
		[Column(Storage="_ModifiedDate", DbType="DateTime NOT NULL")]
		public System.DateTime ModifiedDate
		{
			get
			{
				return this._ModifiedDate;
			}
			set
			{
				if ((this._ModifiedDate != value))
				{
					this.OnModifiedDateChanging(value);
					this.SendPropertyChanging();
					this._ModifiedDate = value;
					this.SendPropertyChanged("ModifiedDate");
					this.OnModifiedDateChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591